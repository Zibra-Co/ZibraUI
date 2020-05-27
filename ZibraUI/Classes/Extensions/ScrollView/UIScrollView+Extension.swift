//
//  UIScrollView+Extension.swift
//
//
//  Created by Mac Ward on 23/08/2018.
//  Copyright © 2018 Zibra Coders. All rights reserved.
//

import UIKit

// MARK: - <#Description#>
public extension UIScrollView {

    /// Return current page index
    ///
    /// - Returns: return `Int` value
    func currentPage() -> Int {
        return Int(contentOffset.x / frame.size.width)
    }
    
    /// Return the total pages number that be in the controller
    ///
    /// - Returns: return `Int` value
    func totalPages() -> Int {
        return Int(contentSize.width / frame.size.width)
    }
    
    /// Change possition to a index
    ///
    /// - Parameter index: `Int` value
    func moveToIndex(_ index: Int) {
        let position = CGPoint(x: frame.size.width * CGFloat(index), y: 0)
        self.setContentOffset(position, animated: true)
    }
    
}
