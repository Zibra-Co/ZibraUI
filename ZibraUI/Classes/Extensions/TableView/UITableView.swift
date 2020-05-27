//
//  UITableView.swift
//
//
//  Created by Mac Ward on 15/10/2018.
//  Copyright © 2018 Zibra Coders All rights reserved.
//

import Foundation

// MARK: - UITableView extension
public extension UITableView {
    /// Remove footer from table view
    func withClearFooter() {
        tableFooterView = UIView()
    }
}
