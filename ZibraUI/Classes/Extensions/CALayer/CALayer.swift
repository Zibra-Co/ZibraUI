//
//  CALayer.swift
//
//
//  Created by Mac Ward on 24/05/2018.
//  Copyright © 2018 Zibra Coders. All rights reserved.
//

import UIKit

// MARK: - CALayer extension
public extension CALayer {

    /// CALayer extension to add border
    ///
    /// - Parameters:
    ///   - edge: `UIRectEdge` object
    ///   - color: `UIColor` object
    ///   - thickness: `CGFloat` object
    func border(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = createLayerWithBorder(edge: edge, color: color, thickness: thickness)
        addSublayer(border)
    }

    /// CALayer extension to add border
    ///
    /// - Parameters:
    ///   - edge: `UIRectEdge` object
    ///   - color: `UIColor` object
    ///   - thickness: `CGFloat` object
    /// - Returns: return `CALayer` object
    func createLayerWithBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) -> CALayer {

        let border = CALayer()

        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }

        border.backgroundColor = color.cgColor

        return border
    }

    /// CALayer extension to add  shadow
    ///
    /// - Parameters:
    ///   - size: `CGSize` objecg
    ///   - opacity: `Float` value
    ///   - radius: `Float` value
    ///   - color: `UIColor` value
    func drawShadow(size: CGSize, opacity: Float, radius: Float, color: UIColor) {
        shadowOffset = size
        shadowOpacity = opacity
        shadowRadius = CGFloat(radius)
        shadowColor = color.cgColor
    }
}
