//
//  ViewController.swift
//  App5
//
//  Created by 田代創大 on 2019/09/23.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer : Timer?
    var count = 0
    let settingKey = "timer_value"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey:10])
        countDownLabel.text = "残り\(settings.integer(forKey: settingKey))秒"
    }

    @IBOutlet weak var countDownLabel: UILabel!
   
    @IBAction func settingButton(_ sender: Any) {
        stopTimer()
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    @IBAction func startButton(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                return
            }
        }
        let settings = UserDefaults.standard
        if count == settings.integer(forKey: settingKey){
            count = -1
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    @IBAction func stopButton(_ sender: Any) {
        stopTimer()
    }
    
    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        let remainCount = timerValue - count
        countDownLabel.text = "残り\(remainCount)秒"
        return remainCount
    }
    
    @objc func timerInterrupt(_ timer:Timer) {
        count += 1
        
        if displayUpdate() <= 0 {
            count = 0
            timer.invalidate()
            
            let alertController = UIAlertController(title: "終了", message: "タイマー終了時間です", preferredStyle: .alert)
            let defaultsAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultsAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        count = 0
        _ = displayUpdate()
    }
    
    private func stopTimer() {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
    }
}

