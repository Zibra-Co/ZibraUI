//
//  ActivityIndicator.swift
//  
//
//  Created by Max Ward on 06/04/2020.
//  Copyright © 2020 Zibra Coders. All rights reserved.
//
import UIKit

public class ActivityIndicatorView: UIView {
    
    private var progressView: UIView!
    static var sharedLoader: ActivityIndicatorView = ActivityIndicatorView(window: UIApplication.shared.windows.first!)
    var frontWindow: UIWindow?
    
    public init(window: UIWindow) {
        super.init(frame: UIScreen.main.bounds)
        self.frontWindow = window
        customizeUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func customizeUI() {
        backgroundColor = .clear
        backgroundColor = .white
        alpha = 0.9
        progressView  = UIView(frame: CGRect(x: (frame.width/2) - 30, y: (frame.height/2) - 30, width: 60, height: 60))
        addSubview(progressView)

    }
    
    public func show() {
        startProgresLoader()
    }
}

extension ActivityIndicatorView: CAAnimationDelegate {
    
    func start() {
        startProgresLoader()
    }
    
    public func hide() {
//        progressView.stopAnimation()
        isHidden = true
        self.removeFromSuperview()
    }

    func startProgresLoader() {
        isHidden = false
        frontWindow?.endEditing(true)
        frontWindow?.addSubview(self)
//        progressView.startAnimation(withColor: UIColor.cornflower.cgColor)
    }
}
