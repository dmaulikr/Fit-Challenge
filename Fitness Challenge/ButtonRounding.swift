//
//  ButtonRounding.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/27/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import UIKit

class ButtonRounding: UIButton {
    
    let SHADOW_GRAY: CGFloat = 120.0 / 255.0
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
            layer.shadowOpacity = 0.8
            layer.shadowRadius = 5.0
            layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            imageView?.contentMode = .scaleAspectFit
            
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            layer.opacity = 0.8
            layer.cornerRadius = self.frame.width / 2
        }
        
}
