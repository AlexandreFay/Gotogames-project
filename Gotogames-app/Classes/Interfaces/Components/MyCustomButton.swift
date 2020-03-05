//
//  MyCustomButton.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 05/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

class MyCustomButton: UIButton {
        
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
                
        drawBackgroundRectangle(of: rect, context: context)
        drawTopBorder(of: rect, context: context)
        
        tintColor = UIColor.black
    }
    
    private func drawBackgroundRectangle(of rect: CGRect, context: CGContext) {
        let path = CGMutablePath()
        let lowerLeftCorner = CGPoint(x: rect.minX, y: rect.maxY)
        let lowerRightCorner = CGPoint(x: rect.maxX, y: rect.maxY)
        let upperRightCorner = CGPoint(x: rect.maxX, y: rect.minY)
        let upperLeftCorner = CGPoint(x: rect.minX, y: rect.minY)
        
        path.move(to: upperRightCorner)
        path.addLine(to: upperLeftCorner)
        path.addArc(tangent1End: upperLeftCorner, tangent2End: lowerLeftCorner, radius: 15.0)
        path.addArc(tangent1End: lowerLeftCorner, tangent2End: lowerRightCorner, radius: 15.0)
        path.addArc(tangent1End: lowerRightCorner, tangent2End: upperRightCorner, radius: 15.0)
        path.closeSubpath()

        context.setFillColor(UIColor.white.cgColor)
        context.addPath(path)
        context.fillPath()
        context.saveGState()
    }
    
    private func drawTopBorder(of rect: CGRect, context: CGContext) {
        let path = CGMutablePath()
        let lowerLeftCorner = CGPoint(x: rect.minX, y: 2)
        let lowerRightCorner = CGPoint(x: rect.maxX, y: 2)
        let upperRightCorner = CGPoint(x: rect.maxX, y: rect.minY)
        let upperLeftCorner = CGPoint(x: rect.minX, y: rect.minY)
        
        path.move(to: upperRightCorner)
        path.addLines(between: [upperRightCorner, lowerRightCorner, lowerLeftCorner, upperLeftCorner])
        path.closeSubpath()
        
        context.setFillColor(UIColor.red.cgColor)
        context.addPath(path)
        context.fillPath()
        context.saveGState()
    }
}
