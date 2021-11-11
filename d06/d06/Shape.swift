//
//  Shape.swift
//  d06
//
//  Created by Константин Мишин on 29.09.2021.
//

import Foundation
import UIKit

class Shape: UIView {
    
    let color: UIColor
    let isCircle : Bool
    let size : CGFloat = 100
    var originalBounds: CGRect!
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        
        self.isCircle = (Int(arc4random_uniform(2)) == 1)
        self.color = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        super.init(frame: frame)
        self.originalBounds = self.bounds
        self.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    override func draw(_ rect: CGRect) {
        self.path = self.isCircle ? UIBezierPath(ovalIn: rect) : UIBezierPath(rect: rect)
        self.color.setFill()
        path.fill()
    }
    
    override public var collisionBoundingPath: UIBezierPath{
        let r = min(min(self.bounds.size.width, self.bounds.size.height), self.size) / 2.0
        if (self.isCircle)
        {
            return UIBezierPath(arcCenter: CGPoint.zero, radius: r, startAngle: 0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)
        } else
        {
            return UIBezierPath(rect: CGRect(x: -r, y: -r, width: 2*r, height: 2*r))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

