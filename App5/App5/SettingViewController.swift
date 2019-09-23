//
//  SettingViewController.swift
//  App5
//
//  Created by 田代創大 on 2019/09/23.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let settinsArray : [Int] = [10,20,30,40,50,60]
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerSettingpicker.delegate = self
        timerSettingpicker.dataSource = self
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        for row in 0..<settinsArray.count {
            if settinsArray[row] == timerValue {
                timerSettingpicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
    }
    
    @IBOutlet weak var timerSettingpicker: UIPickerView!
    @IBAction func decisionButtonAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settinsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settinsArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let settings = UserDefaults.standard
        settings.setValue(settinsArray[row], forKey: settingKey)
        settings.synchronize()
    }
}
