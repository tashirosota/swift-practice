//
//  ViewController.swift
//  App2
//
//  Created by 田代創大 on 2019/09/22.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var jankenImage: UIImageView!
    @IBOutlet weak var jankenLabel: UILabel!
    
    var number = 0
    @IBAction func jankenButton(_ sender: Any) {
        number = Int(arc4random_uniform(3))
        var newNumber = 0
        jankenLabel.text = "最初はグー、ジャンケン"
        jankenImage.image = UIImage(named: "gu")
        repeat {
            newNumber = Int(arc4random_uniform(3))
            
        } while newNumber == number
        
        number = newNumber 
        
        if number == 0 {
            jankenLabel.text = "グー"
            jankenImage.image = UIImage(named: "gu")
        }else if number == 1{
            jankenLabel.text = "チョキ"
            jankenImage.image = UIImage(named: "choki")
        }else if number == 2{
            jankenLabel.text = "パー"
            jankenImage.image = UIImage(named: "pa")
        }
    }
}

