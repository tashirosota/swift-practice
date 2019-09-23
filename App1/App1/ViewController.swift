//
//  ViewController.swift
//  App1
//
//  Created by 田代創大 on 2019/09/22.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        helloWorldLabel.text = "Hello Swift!-2"
    }

    @IBOutlet weak var helloWorldLabel: UILabel!
}

