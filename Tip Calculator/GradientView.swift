//
//  GradientView.swift
//  Tip Calculator
//
//  Created by Gerdin Ventura on 12/27/20.
//  Copyright © 2020 Gerdin Ventura. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable var topColor : UIColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
    @IBInspectable var bottomColor : UIColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
    
    var startPointX : CGFloat = 0
    var startPointY : CGFloat = 0
    var endPointX : CGFloat = 1
    var endPointY : CGFloat = 1
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        
        //        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        //gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
