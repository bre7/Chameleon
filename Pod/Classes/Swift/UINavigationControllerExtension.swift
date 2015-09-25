//
//  UINavigationControllerExtension.swift
//  ChamTest
//
//  Created by Vicc Alexander on 9/25/15.
//  Copyright © 2015 Vicc Alexander. All rights reserved.
//

import Foundation
import UIKit

extension UIStatusBarStyle {
    public static var Contrast: UIStatusBarStyle { // There's no way to add an extra case
        return UIStatusBarStyle(rawValue: 100)!
    }
}

extension UINavigationController {
    // MARK: - Swizzling
    // Thanks to NSHipster for the explanation
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UINavigationController.self {
            print("It's a subclass...Exiting :/")
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = Selector("viewDidLoad")
            let swizzledSelector = Selector("cham_viewDidLoad")
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector,
                method_getImplementation(swizzledMethod),
                method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
    }
    
    // MARK: - Method Swizzling
    
    func cham_viewDidLoad() {
        cham_viewDidLoad()
        
        //        if let navBar = navigationController?.navigationBar {
        ////            findHairlineImageViewUnder(navBar)?.hidden = true
        //        }
        findHairlineImageViewUnder(navigationBar)?.hidden = true
    }
    
    func findHairlineImageViewUnder(view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        
        for subview in view.subviews {
            if let imageView = findHairlineImageViewUnder(subview) {
                return imageView
            }
        }
        return nil
    }
}

extension UINavigationController {
    
    /**
    *  Sets the status bar style for the specified @c UINavigationController and all its child controllers.
    *
    *  @param statusBarStyle The style of the device's status bar.
    *
    *  @note Chameleon introduces a new @c statusBarStyle called @c UIStatusBarStyleContrast.
    *
    *  @since 2.0
    */
    override public func setStatusBarStyle(statusBarStyle: UIStatusBarStyle) {
        if statusBarStyle == UIStatusBarStyle.Contrast {
            shouldContrast = true
        } else {
            shouldUseLightContent = statusBarStyle == .LightContent
        }
    }
    
    override public func preferredStatusBarStyle() -> UIStatusBarStyle {
        super.preferredStatusBarStyle()
        
        if let shouldContrast = shouldContrast where shouldContrast == true {
            guard let barTintColor = navigationBar.barTintColor else { return .Default }

            return barTintColor.contrastingStatusBarStyle()
        } else {
            if let shouldUseLightContent = shouldUseLightContent where shouldUseLightContent == true {
                return .LightContent
            } else {
                return .Default
            }
        }
    }
}
