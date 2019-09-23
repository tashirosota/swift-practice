//
//  ViewController.swift
//  App7
//
//  Created by 田代創大 on 2019/09/23.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, SFSafariViewControllerDelegate {
    
    //JSONのitem内のデータ構造
    struct ItemJson: Codable {
        //お菓子の名称
        let name: String?
        //メーカー
        let maker: String?
        //掲載URL
        let url: URL?
        //画像URL
        let image: URL?
    }
    
    //JSONのデータ構造
    struct ResultJson: Codable {
        //複数要素
        let item:[ItemJson]?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchText.delegate = self
        searchText.placeholder = "お菓子の名前を入力して下さい。"
        snackTable.dataSource = self
        snackTable.delegate = self
    }
    
    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var snackTable: UITableView!
    
    var snackList : [(name:String, maker:String, link:URL, image:URL)] = []
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if let searchWord = searchBar.text {
            print(searchWord)
            searchSnack(keyword: searchWord)
        }
    }
    
    func searchSnack(keyword : String){
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                   return
               }
        guard let req_url = URL(string: "http://www.sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        let req = URLRequest(url: req_url)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: req, completionHandler: {
            (data , response , error) in
            session.finishTasksAndInvalidate()
            do {

                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from: data!)
                
                if let items = json.item {
                    self.snackList.removeAll()
                    for item in items {
                        if let name = item.name, let maker = item.maker, let link = item.url, let image = item.image {
                            let snack = (name, maker, link, image)
                            self.snackList.append(snack)
                        }
                    }
                    
                    self.snackTable.reloadData()
                    if let snackDebug = self.snackList.first {
                        print("--------------")
                        print(snackDebug)
                    }
                }
            } catch {
                print("エラーが出ました")
            }
        })
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return snackList.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "snackCell", for: indexPath)
        cell.textLabel?.text = snackList[indexPath.row].name
        if let imageData = try? Data(contentsOf: snackList[indexPath.row].image){
            cell.imageView?.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let safariViewController = SFSafariViewController(url: snackList[indexPath.row].link)
        safariViewController.delegate = self
        present(safariViewController, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}
