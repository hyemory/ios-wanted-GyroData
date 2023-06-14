//
//  GraphView.swift
//  GyroData
//
//  Created by Hyejeong Jeong on 2023/06/15.
//

import UIKit

final class GraphView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let outerSquareRect = rect
        let innerSquareSize = CGSize(width: outerSquareRect.width / 8, height: outerSquareRect.height / 8)
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.stroke(outerSquareRect)
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(1)
        
        for row in 0..<8 {
            for column in 0..<8 {
                let tileRect = CGRect(origin: CGPoint(x: outerSquareRect.origin.x + CGFloat(column) * innerSquareSize.width,
                                                      y: outerSquareRect.origin.y + CGFloat(row) * innerSquareSize.height),
                                      size: innerSquareSize)
                
                if (row + column) % 2 == 0 {
                    context.stroke(tileRect)
                }
            }
        }
    }
}
