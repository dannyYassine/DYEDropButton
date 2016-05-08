//
//  DYEDropButton.swift
//  DropButton
//
//  Created by Danny Yassine on 2016-05-08.
//  Copyright © 2016 DannyYassine. All rights reserved.
//

import UIKit

class DYEDropButton: UIView {

    var shadowColor: UIColor? {
        set {
            self.backView.layer.shadowColor = newValue!.CGColor
        }
        get {
            if let cgColor = self.backView.layer.shadowColor {
                return UIColor(CGColor: cgColor)
            } else {
                return nil
            }
        }
    }
    
    override var backgroundColor: UIColor? {
        set {
            self.button.backgroundColor = newValue
        }
        get {
            return self.backgroundColor
        }
    }
    
    var middleView: UIView! {
        didSet {
            middleView.clipsToBounds = false
            middleView.backgroundColor = UIColor.blackColor()
            middleView.layer.shadowColor = UIColor.blackColor().CGColor
            middleView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            middleView.layer.shadowRadius = 10.0
            middleView.layer.shadowOpacity = 0.4
        }
    }
    var backView: UIView! {
        didSet {
            backView.clipsToBounds = false
            backView.backgroundColor = UIColor.cyanColor()
            backView.layer.shadowColor = UIColor.cyanColor().CGColor
            backView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            backView.layer.shadowRadius = 10.0
            backView.layer.shadowOpacity = 0.8
        }
    }
    var button: UIButton! {
        didSet {
            
        }
    }
    
    var side_padding: CGFloat {
        return self.bounds.width * 0.1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
        self.clipsToBounds = false
        
        self.initViews()
        self.initActions()
        
    }
    
    private func initViews() {
        self.button = UIButton(frame: self.bounds)
        self.middleView = UIView(frame: CGRect(x: self.side_padding, y: self.bounds.height / 2.0, width: self.bounds.width - (2 * self.side_padding), height: self.bounds.height / 2.0))
        self.backView = UIView(frame: CGRect(x: self.side_padding, y: self.bounds.height / 2.0, width: self.bounds.width - (2 * self.side_padding), height: self.bounds.height / 2.0))
        
        self.addSubview(self.button)
        self.insertSubview(self.middleView, belowSubview: self.button)
        self.insertSubview(self.backView, belowSubview: self.button)

    }
    
    private func initActions() {
        self.button.addTarget(self, action: #selector(didPressOnButton(_:)), forControlEvents: .TouchUpInside)
        self.button.addTarget(self, action: #selector(self.pressOnButton(_:)), forControlEvents: .TouchDown)
    }
    
    func didPressOnButton(sender: AnyObject) {
        self.showShadow()
    }
    
    func pressOnButton(sender: AnyObject) {
        self.hideShadow()
    }
    
    private func showShadow() {
        UIView.animateWithDuration(0.25, animations: {
           
            self.backView.frame.insetInPlace(dx: 0.0, dy: -10.0)
            self.middleView.frame.insetInPlace(dx: 0.0, dy: -10.0)
            
        }) { (done) in
            
        }
    }
    
    private func hideShadow() {
        UIView.animateWithDuration(0.25, animations: {
            
            self.backView.frame.insetInPlace(dx: 0.0, dy: 10.0)
            self.middleView.frame.insetInPlace(dx: 0.0, dy: 10.0)
            
            }) { (done) in
                
        }
    }

}
