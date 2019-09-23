//
//  ViewController.swift
//  App3
//
//  Created by 田代創大 on 2019/09/22.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    let bgmPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    var cymbalPlayer = AVAudioPlayer()
    var guitarPlayer = AVAudioPlayer()
    var bgmPlayer = AVAudioPlayer()
    
    @IBAction func cymbalButton(_ sender: Any) {
        print("come here")
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    @IBAction func guitarButton(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    @IBAction func bgmPlayButton(_ sender: Any) {
       soundPlayer(player: &bgmPlayer, path: bgmPath, count: -1)
    }
    
    @IBAction func bgmStopButton(_ sender: Any) {
        bgmPlayer.stop()
    }
    
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path:URL, count:Int){
        
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました")
        }
    }
}

