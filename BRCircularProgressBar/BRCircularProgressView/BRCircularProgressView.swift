//
//  BRCircularProgressView.swift
//  BRCircularProgressBar
//
//  Created by Brammanand Soni on 3/29/17.
//  Copyright © 2017 Brammanand Soni. All rights reserved.
//

import UIKit

class BRDefaultColor {
    static let circleColor: UIColor = UIColor(red: 233.0/255.0, green: 233.0/255.0, blue: 233.0/255.0, alpha: 1)
    static let circleBackgroundColor: UIColor = UIColor.white
    static let progressCircleColor: UIColor = UIColor(red: 0.0/255.0, green: 184.0/255.0, blue: 249.0/255.0, alpha: 1)
    static let progressCircleBackgroundColor: UIColor = UIColor(red: 0.0/255.0, green: 184.0/255.0, blue: 249.0/255.0, alpha: 0.2)
}

class BRCircularProgressView: UIView {
    
    // progress: Should be between 0 to 1
    var progress: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    private var circleStrokeWidth: CGFloat = 5
    private var circleColor: UIColor = BRDefaultColor.circleColor
    private var circleBackgroundColor: UIColor = BRDefaultColor.circleBackgroundColor
    private var progressCircleColor: UIColor = BRDefaultColor.progressCircleColor
    private var progressCircleBackgroundColor: UIColor = BRDefaultColor.progressCircleBackgroundColor
    
    private var textLabel: UILabel!
    private var textFont: UIFont? = UIFont.boldSystemFont(ofSize: 17)
    private var textColor: UIColor? = UIColor.black
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: Public Methods
    
    func setCircleStrokeWidth(_ circleStrokeWidth: CGFloat) {
        self.circleStrokeWidth = circleStrokeWidth
        setCircleColor()
    }
    
    func setCircleColor(_ circleColor: UIColor = BRDefaultColor.circleColor, circleBackgroundColor: UIColor = BRDefaultColor.circleBackgroundColor, progressCircleColor: UIColor = BRDefaultColor.progressCircleColor, progressCircleBackgroundColor: UIColor = BRDefaultColor.progressCircleBackgroundColor) {
        self.circleColor = circleColor
        self.circleBackgroundColor = circleBackgroundColor
        self.progressCircleColor = progressCircleColor
        self.progressCircleBackgroundColor = progressCircleBackgroundColor
        
        self.setNeedsDisplay()
    }
    
    func setProgressText(_ text: String) {
        textLabel.text = text
    }
    
    func setProgressTextFont(_ font: UIFont = UIFont.boldSystemFont(ofSize: 17), color: UIColor = UIColor.black) {
        textLabel.font = font
        textLabel.textColor = color
    }

    // MARK: Private Methods
    
    private func setupView() {
        textLabel = UILabel(frame: self.bounds)
        textLabel.textAlignment = .center
        textLabel.font = textFont
        textLabel.textColor = textColor
        textLabel.numberOfLines = 0
        
        self.addSubview(textLabel)
    }
    
    // MARK: Core Graphics Drawing
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawRect(rect, margin: 0, color: circleColor, percentage: 1)
        drawRect(rect, margin: circleStrokeWidth, color: circleBackgroundColor, percentage: 1)
        drawRect(rect, margin: circleStrokeWidth, color: progressCircleBackgroundColor, percentage: progress)
        
        drawProgressCircle(rect)
    }
    
    private func drawRect(_ rect: CGRect, margin: CGFloat, color: UIColor, percentage: CGFloat) {
        
        let radius: CGFloat = min(rect.height, rect.width) * 0.5 - margin
        let centerX: CGFloat = rect.width * 0.5
        let centerY: CGFloat = rect.height * 0.5
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        let center: CGPoint = CGPoint(x: centerX, y: centerY)
        context.move(to: center)
        let startAngle: CGFloat = -.pi/2
        let endAngle: CGFloat = -.pi/2 + .pi * 2 * percentage
        context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        context.closePath()
        context.fillPath()
    }
    
    private func drawProgressCircle(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setLineWidth(circleStrokeWidth)
        context.setStrokeColor(progressCircleColor.cgColor)
        
        let centerX: CGFloat = rect.width * 0.5
        let centerY: CGFloat = rect.height * 0.5
        let radius: CGFloat = min(rect.height, rect.width) * 0.5 - (circleStrokeWidth / 2)
        let startAngle: CGFloat = -.pi/2
        let endAngle: CGFloat = -.pi/2 + .pi * 2 * progress
        let center: CGPoint = CGPoint(x: centerX, y: centerY)
        
        context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        context.strokePath()
    }
}
