//
//  ViewController.swift
//  DropButton
//
//  Created by Danny Yassine on 2016-05-08.
//  Copyright © 2016 DannyYassine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainButton: DYEDropButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mainButton.backgroundColor = UIColor.orangeColor()
        self.mainButton.shadowColor = UIColor.orangeColor()
        
        self.mainButton.layer.cornerRadius = 3.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

