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
            self.bottomButton.color = UIColor.greenColor()
            self.bottomButton.shadowColor = UIColor.greenColor()
            self.bottomButton.button.layer.cornerRadius = 3.0
            self.bottomButton.button.layer.masksToBounds = true
            self.bottomButton.button.setTitle("Move me", forState: .Normal)
            self.bottomButton.button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            self.bottomButton.inverse = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.pan(_:)))
        self.bottomButton.addGestureRecognizer(pan)
        
    }
    
    func pan(sender: UIPanGestureRecognizer) {
        
        let location = sender.locationInView(self.view)
        let center = sender.locationInView(self.bottomButton)
        
        if sender.state == .Began {
            self.bottomButton.layer.anchorPoint = CGPoint(x: center.x / self.bottomButton.bounds.width, y: center.y / self.bottomButton.bounds.height)
            self.bottomButton.center = location
        } else if sender.state == .Changed {
            self.bottomButton.center = location
        } else if sender.state == .Ended {
            self.bottomButton.didPressOnButton(self.bottomButton)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

