//
//  ViewController.swift
//  DropButton
//
//  Created by Danny Yassine on 2016-05-08.
//  Copyright © 2016 DannyYassine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topButton: DYEDropButton! {
        didSet {
            self.topButton.button.setTitle("Press Me", forState: .Normal)
            self.topButton.button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
    }
    @IBOutlet weak var mainButton: DYEDropButton! {
        didSet {
            self.mainButton.color = UIColor.orangeColor()
            self.mainButton.shadowColor = UIColor.orangeColor()
            self.mainButton.button.layer.cornerRadius = 3.0
            self.mainButton.button.layer.masksToBounds = true
            self.mainButton.button.setTitle("Press Me", forState: .Normal)
            self.mainButton.button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
    }
    @IBOutlet weak var bottomButton: DYEDropButton! {
        didSet {
            self.bottomButton.color = UIColor.cyanColor()
            self.bottomButton.shadowColor = UIColor.cyanColor()
            self.bottomButton.button.layer.cornerRadius = 3.0
            self.bottomButton.button.layer.masksToBounds = true
            self.bottomButton.button.setTitle("Press Me", forState: .Normal)
            self.bottomButton.button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

