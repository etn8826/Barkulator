//
//  PawButton.swift
//  Test2
//
//  Created by Einstein Nguyen on 4/14/20.
//  Copyright © 2020 Einstein Nguyen. All rights reserved.
//

import UIKit

class PawButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
//        setShadow()
        setBackgroundImage(UIImage(named: "paw"), for: .normal)
        setBackgroundImage(UIImage(named: "paw"), for: .highlighted)
        setTitleColor(.brown, for: .normal)
        titleLabel?.font    = UIFont(name: "Courier-Bold", size: 40)
        contentVerticalAlignment = .bottom
        isUserInteractionEnabled = true
//        layer.cornerRadius  = 25
//        layer.borderWidth   = 3.0
//        layer.borderColor   = UIColor.darkGray.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }

    func buttonShake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration  = 0.1
        shake.repeatCount   =   2
        shake.autoreverses  = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue  = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue   = toValue
        
        layer.add(shake, forKey: "position")
    }
}
