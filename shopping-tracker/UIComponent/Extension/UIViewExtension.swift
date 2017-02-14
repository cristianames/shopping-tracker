//
//  UIViewExtension.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/13/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

import Cartography

struct Border {
    
    let height: Float
    let color: UIColor
    
    init(height: Float, color: UIColor) {
        self.height = height
        self.color = color
    }
}

extension UIView {
    
    fileprivate var rotationAnimationKey: String {
        return "com.syrmo.rotation-animation"
    }
    
    func topBorder(_ border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: superview!.bounds.width - offset, height: CGFloat(border.height)))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    func bottomBorder(_ border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: bounds.height, width: superview!.bounds.width - offset,
                                              height: CGFloat(border.height)))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    func leftBorder(_ border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(border.height), height: bounds.height))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    func rigthBorder(_ border: Border, offset: CGFloat) {
        let borderView = UIView(frame: CGRect(x: superview!.bounds.width - offset, y: 0, width: CGFloat(border.height),
                                              height: bounds.height))
        borderView.backgroundColor = border.color
        addSubview(borderView)
    }
    
    /// Loads the nib for the specific view. If called without specifying the identifier, it will use the view name as the xib name.
    ///
    /// - parameter identifier: View's xib identifier, default = nil.
    /// - parameter bundle: Specific bundle, default = nil.
    /// - returns: The loaded UIView
    class func loadFromNib<T: UIView>() -> T {
        let nibName = NSStringFromClass(self).components(separatedBy: ".").last!
        return Bundle.main.loadNibNamed(nibName, owner: Bundle.main, options: nil)![0] as! T
    }
    
    /// Loads the view into the specified containerView.
    ///
    /// It can be done after self's view is initialized, as it uses constraints to determine the size.
    ///
    /// - parameter containerView: The container view.
    /// - parameter viewPositioning: Back or Front. Default: Front
    public func loadInto(_ containerView: UIView, viewPositioning: ViewPositioning = .front) {
        containerView.addSubview(self)
        
        constrain(self, containerView) { controllerView, containerView in
            controllerView.bottom == containerView.bottom
            controllerView.top == containerView.top
            controllerView.left == containerView.left
            controllerView.right == containerView.right
        }
        
        if case viewPositioning = ViewPositioning.back {
            containerView.sendSubview(toBack: self)
        }
    }
    
    public func rotate360Degrees(_ duration: CFTimeInterval = 1.0, completionDelegate: CAAnimationDelegate? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        
        if let delegate = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        layer.add(rotateAnimation, forKey: rotationAnimationKey)
    }
    
    public func stopRotation() {
        if let _ = layer.animation(forKey: rotationAnimationKey) {
            layer.removeAnimation(forKey: rotationAnimationKey)
        }
        
    }
    
}
