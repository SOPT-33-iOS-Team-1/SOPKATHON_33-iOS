//
//  ProgressView.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import UIKit

class ProgressView: UIView {
    var ringColor: UIColor?
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-0.5 * Double.pi)
    private var endPoint = CGFloat(1.5 * Double.pi)

    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    func createCircularPath() {
        guard let ringColor else { return }
        self.backgroundColor = .white
        let circularPath = UIBezierPath(arcCenter: .init(
            x: self.frame.width / 2.0,
            y: self.frame.height / 2.0),
            radius: (frame.size.height - 10) / 2.0 ,
            startAngle: startPoint,
            endAngle: endPoint,
            clockwise: true
        )
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 15
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor =  UIColor.black.withAlphaComponent(0.4).cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 15
        progressLayer.strokeStart = 0.0
//        progressLayer.strokeEnd = 0.5
        
        progressLayer.strokeColor = ringColor.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, value: Double) {
        // created circularProgressAnimation with keyPath

        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.fromValue = 0
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}



