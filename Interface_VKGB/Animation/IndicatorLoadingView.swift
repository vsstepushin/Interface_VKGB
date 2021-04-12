//
//  IndicatorLoadingView.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 09.03.2021.
//

import UIKit

final class IndicatorLoadingView: UIView {

    var circlesIndicator = [CALayer]()
    let containerLoadView = UIView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let countCircles = 3
        let side: CGFloat = 10
        let offset: CGFloat = 5
        print(bounds.width)
        let x: CGFloat = 0
        let colorCircle = UIColor.white
        
        for i in 0..<countCircles {
            let circle = CAShapeLayer()
            circle.opacity = 0.5
            circle.path = UIBezierPath(ovalIn: CGRect(x: x + (side + offset) * CGFloat(i), y: 10, width: side, height: side)).cgPath
            circle.fillColor = colorCircle.cgColor
            containerLoadView.layer.addSublayer(circle)
            circlesIndicator.append(circle)
        }
        containerLoadView.center = CGPoint(x: bounds.width / 2.4, y: bounds.height / 2.4)
        addSubview(containerLoadView)
        startLoadAnimation()
    }
    
    private func startLoadAnimation() {
        var offset: TimeInterval = 0.0
        circlesIndicator.forEach {
            $0.removeAllAnimations()
            $0.add(scaleLoadAnimation(offset), forKey: nil)
            offset = offset + 0.10
        }
    }
    
    private func scaleLoadAnimation(_ after: TimeInterval = 0) -> CAAnimationGroup {
        let downScale = CABasicAnimation(keyPath: "opacity")
        downScale.beginTime = after
        downScale.fromValue = 0.1
        downScale.toValue = 1.0
        downScale.duration = 2
        downScale.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        let group = CAAnimationGroup()
        group.animations = [downScale]
        group.repeatCount = Float.infinity
        group.autoreverses = false
        group.duration = CFTimeInterval(1)
        
        return group
    }
}
