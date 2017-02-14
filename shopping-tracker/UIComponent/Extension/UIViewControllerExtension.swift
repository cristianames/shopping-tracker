//
//  UIViewControllerExtension.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/13/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

import Cartography

extension UIViewController {
    var hideBars: Bool {
        set {
            setHiddenValueFromBarsTo(newValue)
        }
        
        get {
            return false
        }
    }
    
    var mainViewController: MainViewController? {
        let windows = UIApplication.shared.windows
        let mainWindow = windows.index { window in
            if let rootViewController = window.rootViewController {
                return rootViewController is MainViewController
            } else {
                return false
            }
        }.map { windows[$0] }
        return mainWindow?.rootViewController as? MainViewController
    }
    
    fileprivate func setHiddenValueFromBarsTo(_ value: Bool) {
        tabBarController?.tabBar.isHidden = value
        UIApplication.shared.isStatusBarHidden = value
    }
    
    /// Loads the childViewController into the specified containerView.
    ///
    /// It can be done after self's view is initialized, as it uses constraints to determine the childViewController size.
    /// Take into account that self will retain the childViewController, so if for any other reason the childViewController is retained in another place, this would
    /// lead to a memory leak. In that case, one should call unloadViewController().
    ///
    /// - parameter childViewController: The controller to load.
    /// - parameter into: The containerView into which the controller will be loaded.
    /// - parameter viewPositioning: Back or Front. Default: Front
    public func loadViewController(_ childViewController: UIViewController, into containerView: UIView, viewPositioning: ViewPositioning = .front) {
        childViewController.willMove(toParentViewController: self)
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
        childViewController.view.loadInto(containerView, viewPositioning: viewPositioning)
    }
    
    /// Unloads a childViewController and its view from its parentViewController.
    public func unloadFromParentViewController() {
        view.removeFromSuperview()
        removeFromParentViewController()
    }
}

public enum ViewPositioning {
    
    case back, front
    
}
