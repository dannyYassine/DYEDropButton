//
//  DropButton.swift
//  DropButton
//
//  Created by Danny Yassine on 2016-05-30.
//  Copyright © 2016 DannyYassine. All rights reserved.
//

import UIKit

class DYEDropButton: UIButton {
    
    fileprivate var middleView: UIView! {
        didSet {
            middleView.clipsToBounds = false
            middleView.backgroundColor = UIColor.black
            middleView.layer.cornerRadius = super.layer.cornerRadius
            middleView.layer.shadowColor = UIColor.black.cgColor
            middleView.layer.shadowOffset = CGSize(width: 0.0, height: 12.0)
            middleView.layer.shadowRadius = 7.5
            middleView.layer.shadowOpacity = 0.4
        }
    }
    fileprivate var backView: UIView! {
        didSet {
            backView.clipsToBounds = false
            backView.backgroundColor = self.shadowColor
            backView.layer.cornerRadius = super.layer.cornerRadius
            backView.layer.shadowColor = self.shadowColor.cgColor
            backView.layer.shadowOffset = CGSize(width: 0.0, height: 12.0)
            backView.layer.shadowRadius = 5
            backView.layer.shadowOpacity = 0.8
        }
    }
    
    internal var inverse: Bool! {
        didSet {
            if self.inverse == true {
                if self.backView != nil {
                   self.backView.frame = self.backView.frame.insetBy(dx: 0.0, dy: -10.0)
                }
                if self.middleView != nil {
                    self.middleView.frame = self.middleView.frame.insetBy(dx: 0.0, dy: -10.0)
                }
            } else {
                if self.backView != nil {
                    self.backView.frame = self.backView.frame.insetBy(dx: 0.0, dy: 10.0)
                }
                if self.middleView != nil {
                    self.middleView.frame = self.middleView.frame.insetBy(dx: 0.0, dy: 10.0)
                }
            }
        }
    }
    
    internal var shadowColor: UIColor! {
        didSet {
            if let backView = self.backView {
                backView.backgroundColor = self.shadowColor
                backView.layer.shadowColor = self.shadowColor!.cgColor
            }
        }
    }
    
    fileprivate var side_padding: CGFloat {
        return self.bounds.width * 0.05
    }
    
    fileprivate var isShadowHidden: Bool!
    var initiallyhideShadow: Bool = false
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.inverse = false
        self.shadowColor = UIColor.white
        
        self.clipsToBounds = false
        
        self.initActions()
        
        self.backgroundColor = UIColor.white
        self.shadowColor = UIColor.white
        self.isShadowHidden = false
    }
    
    fileprivate func initActions() {
        self.addTarget(self, action: #selector(didPressOnButton(_:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(didPressOffButton(_:)), for: .touchUpOutside)
        self.addTarget(self, action: #selector(pressOnButton(_:)), for: .touchDown)
        self.addTarget(self, action: #selector(pressOnButton(_:)), for: .touchDragEnter)
        self.addTarget(self, action: #selector(touchCancel(_:)), for: .touchDragExit)
    }
    
    //MARK: - Draw Shadows

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if self.backView == nil && self.middleView == nil {
            self.drawShadowViews()
        }
        
    }
    
    fileprivate func drawShadowViews() {
        
        self.middleView = UIView(frame: CGRect(x: self.frame.origin.x + self.side_padding, y: self.frame.origin.y + self.bounds.height / 2.0 - 10.0, width: self.bounds.width - (2 * self.side_padding), height: self.bounds.height / 2.0))
        self.backView = UIView(frame: CGRect(x: self.frame.origin.x + self.side_padding, y: self.frame.origin.y + self.bounds.height / 2.0 - 10.0, width: self.bounds.width - (2 * self.side_padding), height: self.bounds.height / 2.0))
        
        if let _ = self.superview {
            self.superview!.insertSubview(self.middleView, belowSubview: self)
            self.superview!.insertSubview(self.backView, belowSubview: self)
        }
       
        if self.initiallyhideShadow == true {
            self.hideShadow()
        }
    }
    
    //MARK: - Target Actions
    
    @objc fileprivate func didPressOnButton(_ sender: AnyObject) {
        self.appearShadow()
    }
    
    @objc fileprivate func didPressOffButton(_ sender: AnyObject) {
        if self.isShadowHidden == true {
            self.appearShadow()
        }
    }
    
    @objc fileprivate func touchCancel(_ sender: AnyObject) {
        self.appearShadow()
    }
    
    @objc fileprivate func pressOnButton(_ sender: AnyObject) {
        self.disapearShadow()
    }
    
    //MARK: - Public Shadow Animation
    
    internal func showShadow() {
        if self.isShadowHidden == true {
            self.appearShadow()
        }
    }
    
    internal func hideShadow() {
        if self.isShadowHidden == false {
            self.disapearShadow()
        }
    }
    
    //MARK: - Shadow Animation
    
    fileprivate func appearShadow() {
        self.isShadowHidden = false
        UIView.animate(withDuration: 0.25, animations: {
            
            if self.inverse == true {
                self.backView.frame = self.backView.frame.insetBy(dx: 0.0, dy: 10.0)
                self.middleView.frame = self.middleView.frame.insetBy(dx: 0.0, dy: 10.0)
            } else {
                self.backView.frame = self.backView.frame.insetBy(dx: 0.0, dy: -10.0)
                self.middleView.frame = self.middleView.frame.insetBy(dx: 0.0, dy: -10.0)
            }
            
        }, completion: { (done) in
            
        }) 
    }
    
    fileprivate func disapearShadow() {
        self.isShadowHidden = true
        UIView.animate(withDuration: 0.25, animations: {
            
            if self.inverse == true {
                self.backView.frame = self.backView.frame.insetBy(dx: 0.0, dy: -10.0)
                self.middleView.frame = self.middleView.frame.insetBy(dx: 0.0, dy: -10.0)
            } else {
                self.backView.frame = self.backView.frame.insetBy(dx: 0.0, dy: 10.0)
                self.middleView.frame = self.middleView.frame.insetBy(dx: 0.0, dy: 10.0)
            }
            
        }, completion: { (done) in
            
        }) 
    }
    
}
