//
//  ViewController.swift
//  ZibraUI
//
//  Created by macward on 05/26/2020.
//  Copyright (c) 2020 macward. All rights reserved.
//

import UIKit
import ZibraUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.hideLoadingView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//extension CALayer {
//
///// CALayer extension to add border
/////
///// - Parameters:
/////   - edge: `UIRectEdge` object
/////   - color: `UIColor` object
/////   - thickness: `CGFloat` object
//func border(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
//    let border = createLayerWithBorder(edge: edge, color: color, thickness: thickness)
//    addSublayer(border)
//    }
//
//    func createLayerWithBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) -> CALayer {
//
//         let border = CALayer()
//
//         switch edge {
//         case .top:
//             border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
//         case .bottom:
//             border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
//         case .left:
//             border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
//         case .right:
//             border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
//         default:
//             break
//         }
//
//         border.backgroundColor = color.cgColor
//
//         return border
//     }
//
//}
