//
//  BaseViewController.swift
//  
//
//  Created by Max Ward on 06/04/2020.
//  Copyright © 2020 Zibra Coders. All rights reserved.
//

import UIKit

public enum AlertConfirmResult {
    case cancel, accept
}

public protocol BaseView: class {
    
    func dismissKeyboard()
    func showLoadingView()
    func hideLoadingView()
    func showAlert(with error: Error)
    func showAlert(title: String, message: String)
    func showConfirm(title: String, message: String, completion: @escaping (AlertConfirmResult) -> Void)
    func showConfirm(title: String, message: String, cancelTitle: String, acceptTitle: String, completion: @escaping (AlertConfirmResult) -> Void)
    func showAlert(title: String, message: String, action: UIAlertAction)
    func showAlert(title: String, message: String, actions: [UIAlertAction])
    func share(item: Any)
    
    // UIViewController functions
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func dissmiss(completion: (() -> Void)?)
    func popViewController()
    func popViewController(_ animated: Bool, completion: @escaping (() -> Void))
    func popToRootView()
    func push(view: UIViewController)
}

extension UIViewController: BaseView {
    
    @objc open func showLoadingView() {
        guard presentedViewController != nil else {
            ActivityIndicatorView.sharedLoader.show()
            return
        }
    }
    
    @objc open func hideLoadingView() {
        ActivityIndicatorView.sharedLoader.hide()
    }
    
    @objc public func dismissKeyboard() {
        guard let currentFirstResponder = view.currentFirstResponder() else { return }
        currentFirstResponder.resignFirstResponder()
    }
    
    
    public func showAlert(with error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
    }
    
    public func showAlert(title: String, message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
    
    public func showAlert(title: String, message: String, action: UIAlertAction) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(action)
        present(alertViewController, animated: true, completion: nil)
    }
    
    public func showAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertViewController.addAction(action)
        }
        present(alertViewController, animated: true, completion: nil)
    }
    
    public func showConfirm(title: String, message: String, completion: @escaping (AlertConfirmResult) -> Void) {
        showConfirm(title: title, message: message, cancelTitle: "Cancelar", acceptTitle: "Aceptar", completion: completion)
    }
    
    public func showConfirm(title: String, message: String, cancelTitle: String, acceptTitle: String, completion: @escaping (AlertConfirmResult) -> Void) {
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: cancelTitle, style: .default, handler: { _ in
            completion(.cancel)
        }))
        alertViewController.addAction(UIAlertAction(title: acceptTitle, style: .default, handler: { _ in
            completion(.accept)
        }))

        present(alertViewController, animated: true, completion: nil)
    }
    
    public func tapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    public func share(item: Any) {
        let itemToShare = [item]
        let activityViewController = UIActivityViewController(activityItems: itemToShare, applicationActivities: [])
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    public func dissmiss(completion: (() -> Void)? = nil) {
        self.dismiss(animated: true, completion: completion)
    }
    
    @objc open func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    open func popViewController(_ animated: Bool, completion: @escaping (() -> Void)) {
        self.navigationController?.popViewController(animated, completion: completion)
    }
    
    public func popToRootView() {
        self.navigationController?.popToRootViewController(animated: true)
    }
        
    public func push(view: UIViewController) {
        self.navigationController?.pushViewController(view, animated: true)
    }
}
