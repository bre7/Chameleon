//
//  UIViewControllerExtension.swift
//  ChamTest
//
//  Created by Vicc Alexander on 9/23/15.
//  Copyright © 2015 Vicc Alexander. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: - Methods
    
    func setThemeUsingPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        if contentStyle == .Contrast {
            if ContrastColor(primaryColor,true).isEqual(FlatWhite()) {
                UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
            } else {
                UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: false)
            }
        } else {
            if contentStyle == .Light {
                UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
            } else {
                UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: false)
            }
        }
        UIViewController.self.customizeBarButtonItemWithPrimaryColor(primaryColor, contentStyle:contentStyle)
        UIViewController.self.customizeButtonWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeNavigationBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizePageControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeProgressViewWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSearchBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSegmentedControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSliderWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeStepperWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSwitchWithPrimaryColor(primaryColor)
        UIViewController.self.customizeTabBarWithBarTintColor(FlatWhite(), andTintColor:primaryColor)
        UIViewController.self.customizeToolbarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        
    }
    
    func setThemeUsingPrimaryColor(primaryColor: UIColor, withSecondaryColor secondaryColor: UIColor, andContentStyle contentStyle: UIContentStyle) {
        if contentStyle == .Contrast {
            if ContrastColor(primaryColor,true).isEqual(FlatWhite()) {
                UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
            } else {
                UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: false)
            }
        } else {
            if contentStyle == .Light {
                UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
            } else {
                UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: false)
            }
        }
        UIViewController.self.customizeBarButtonItemWithPrimaryColor(primaryColor, contentStyle:contentStyle)
        UIViewController.self.customizeButtonWithPrimaryColor(primaryColor, secondaryColor:secondaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeNavigationBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizePageControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeProgressViewWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        UIViewController.self.customizeSearchBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSegmentedControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSliderWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        UIViewController.self.customizeStepperWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSwitchWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        UIViewController.self.customizeTabBarWithBarTintColor(FlatWhite(), andTintColor:primaryColor)
        UIViewController.self.customizeToolbarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        
    }
    
    func setThemeUsingPrimaryColor(primaryColor: UIColor, withSecondaryColor secondaryColor: UIColor, usingFontName fontName: String, andContentStyle contentStyle: UIContentStyle) {
        if contentStyle == .Contrast {
            if ContrastColor(primaryColor,true).isEqual(FlatWhite()) {
                UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
            } else {
                UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: false)
            }
        } else {
            if contentStyle == .Light {
                UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
            } else {
                UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: false)
            }
        }
        
        UILabel.appearance().setSubstituteFontName(fontName)
        UIButton.appearance().setSubstituteFontName(fontName)
        UIViewController.self.customizeButtonWithPrimaryColor(primaryColor, secondaryColor:secondaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeBarButtonItemWithPrimaryColor(primaryColor, fontName:fontName, fontSize:18, contentStyle:contentStyle)
        UIViewController.self.customizeNavigationBarWithBarColor(primaryColor, textColor:ContrastColor(primaryColor,true), fontName:fontName, fontSize:20, buttonColor:ContrastColor(primaryColor,true))
        UIViewController.self.customizePageControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeProgressViewWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        UIViewController.self.customizeSearchBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSegmentedControlWithPrimaryColor(primaryColor, withFontName:fontName, withFontSize:14, withContentStyle:contentStyle)
        UIViewController.self.customizeSliderWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        UIViewController.self.customizeStepperWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        UIViewController.self.customizeSwitchWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        UIViewController.self.customizeTabBarWithBarTintColor(FlatWhite(), andTintColor:primaryColor)
        UIViewController.self.customizeToolbarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        
    }
    
    // MARK: - UIBarButtonItem
    class func customizeBarButtonItemWithPrimaryColor(primaryColor: UIColor, contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIBarButtonItem.appearance().tintColor = (primaryColor)
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = (contentColor)
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = (contentColor)
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = (contentColor)
        
    }
    
    class func customizeBarButtonItemWithPrimaryColor(primaryColor: UIColor, fontName: String, fontSize: Float, contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIBarButtonItem.appearance().tintColor = (primaryColor)
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = (contentColor)
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = (contentColor)
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = (contentColor)
        
        if let font = UIFont(name:fontName, size:CGFloat(fontSize)) {
            UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:contentColor, NSFontAttributeName:font], forState:.Normal)
        }
        
    }
    
    // MARK: - UIButton
    class func customizeButtonWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIButton.appearance().tintColor = (contentColor)
        UIButton.appearance().backgroundColor = primaryColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = (contentColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = (contentColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = (contentColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).tintColor = (primaryColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).backgroundColor = ClearColor()
        UIButton.appearance().setTitleShadowColor(ClearColor(), forState:.Normal)
        
    }
    
    class func customizeButtonWithPrimaryColor(primaryColor: UIColor, secondaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        let secondaryContentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: secondaryColor)
        
        UIButton.appearance().tintColor = (secondaryContentColor)
        UIButton.appearance().backgroundColor = secondaryColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = (contentColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = (contentColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = (contentColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).tintColor = (primaryColor)
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).backgroundColor = ClearColor()
        UIButton.appearance().setTitleShadowColor(ClearColor(), forState:.Normal)
        
    }
    
    // MARK: - UILabel
    class func customizeLabelWithPrimaryColor(primaryColor: UIColor, fontName: String, fontSize: CGFloat, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UILabel.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).textColor = contentColor
        UILabel.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).textColor = contentColor
        
        if let font = UIFont(name:fontName, size:fontSize) {
            UILabel.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).font = font
            UILabel.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UITextField.self]).font = UIFont(name:fontName, size:14)!
            UILabel.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIButton.self]).font = UIFont(name:fontName, size:18)!
        }
        
    }
    
    // MARK: - UINavigationBar
    class func customizeNavigationBarWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).barTintColor = (primaryColor)
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (contentColor)
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).titleTextAttributes = [NSForegroundColorAttributeName:contentColor]
//        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).shadowImage = (UIImage.new())
//        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).setBackgroundImage(UIImage.new(), forBarMetrics:UIBarMetricsDefault)
        
    }
    
    class func customizeNavigationBarWithBarColor(barColor: UIColor, textColor: UIColor, buttonColor: UIColor) {
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).barTintColor = (barColor)
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (buttonColor)
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).titleTextAttributes = [NSForegroundColorAttributeName:textColor]
//        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).shadowImage = (UIImage.new())
//        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).setBackgroundImage(UIImage.new(), forBarMetrics:UIBarMetricsDefault)
        
    }
    
    class func customizeNavigationBarWithBarColor(barColor: UIColor, textColor: UIColor, fontName: String, fontSize: CGFloat, buttonColor: UIColor) {
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([self]).barTintColor = (barColor)
        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (buttonColor)
//        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).shadowImage = (UIImage.new())
//        UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).setBackgroundImage(UIImage.new(), forBarMetrics:UIBarMetricsDefault)
        if let font = UIFont(name:fontName, size:fontSize) {
            UINavigationBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).titleTextAttributes = [NSForegroundColorAttributeName:textColor, NSFontAttributeName:font]
        }
        
    }
    
    // MARK: - UIPageControl
    class func customizePageControlWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).currentPageIndicatorTintColor = primaryColor
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).pageIndicatorTintColor = primaryColor.colorWithAlphaComponent(0.4)
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).currentPageIndicatorTintColor = contentColor
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).pageIndicatorTintColor = contentColor.colorWithAlphaComponent(0.4)
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).currentPageIndicatorTintColor = contentColor
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).pageIndicatorTintColor = contentColor.colorWithAlphaComponent(0.4)
        
    }
    
    // MARK: - UIProgressView
    class func customizeProgressViewWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).progressTintColor = primaryColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).progressTintColor = contentColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).progressTintColor = contentColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).trackTintColor = UIColor.lightGrayColor()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    class func customizeProgressViewWithPrimaryColor(primaryColor: UIColor, andSecondaryColor secondaryColor: UIColor) {
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).progressTintColor = secondaryColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).progressTintColor = secondaryColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).progressTintColor = secondaryColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).trackTintColor = UIColor.lightGrayColor()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    // MARK: - UISearchBar
    class func customizeSearchBarWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISearchBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).barTintColor = (primaryColor)
        UISearchBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).backgroundColor = primaryColor
        UISearchBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (contentColor)
//        UISearchBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).setBackgroundImage(UIImage.new(), forBarPosition:UIBarPositionAny, barMetrics:UIBarMetricsDefault)
        
    }
    
    // MARK: - UISegmentedControl
    class func customizeSegmentedControlWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (primaryColor)
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).tintColor = (contentColor)
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).tintColor = (contentColor)
        
    }
    
    class func customizeSegmentedControlWithPrimaryColor(primaryColor: UIColor, withFontName fontName: String, withFontSize fontSize: CGFloat, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (primaryColor)
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).tintColor = (contentColor)
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).tintColor = (contentColor)

        if let font = UIFont(name:fontName, size:fontSize) {
            UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).setTitleTextAttributes([NSFontAttributeName:font], forState:.Normal)
        }
    }
    
    // MARK: - UISlider
    class func customizeSliderWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).minimumTrackTintColor = primaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).minimumTrackTintColor = contentColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).minimumTrackTintColor = contentColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).maximumTrackTintColor = UIColor.lightGrayColor()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    class func customizeSliderWithPrimaryColor(primaryColor: UIColor, andSecondaryColor secondaryColor: UIColor) {
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).minimumTrackTintColor = secondaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).minimumTrackTintColor = secondaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).minimumTrackTintColor = secondaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).maximumTrackTintColor = UIColor.lightGrayColor()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    // MARK: - UIStepper
    class func customizeStepperWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIStepper.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (primaryColor)
        UIStepper.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).tintColor = (contentColor)
        UIStepper.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).tintColor = (contentColor)
        
    }
    
    // MARK: - UISwitch
    class func customizeSwitchWithPrimaryColor(primaryColor: UIColor) {
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).onTintColor = primaryColor
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).onTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).onTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    class func customizeSwitchWithPrimaryColor(primaryColor: UIColor, andSecondaryColor secondaryColor: UIColor) {
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).onTintColor = secondaryColor
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UINavigationBar.self]).onTintColor = secondaryColor
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIViewController.self,UIToolbar.self]).onTintColor = secondaryColor
        
    }
    
    // MARK: - UITabBar
    class func customizeTabBarWithBarTintColor(barTintColor: UIColor, andTintColor tintColor: UIColor) {
        UITabBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).barTintColor = (barTintColor)
        UITabBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = (tintColor)
        
    }
    
    class func customizeTabBarWithBarTintColor(barTintColor: UIColor, tintColor: UIColor, fontName: String, fontSize: CGFloat) {
        UITabBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).barTintColor = barTintColor
        UITabBar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor = tintColor

        if let font = UIFont(name:fontName, size:fontSize) {
            UITabBarItem.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).setTitleTextAttributes([NSFontAttributeName:font], forState:.Normal)
        }
    }
    
    // MARK: - UIToolbar
    class func customizeToolbarWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = Chameleon.colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIToolbar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).tintColor     = contentColor
        UIToolbar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).barTintColor  = primaryColor
        UIToolbar.appearanceWhenContainedInInstancesOfClasses([UIViewController.self]).clipsToBounds = true
    }
}

extension UIViewController {
    // MARK: - Swizzling
    // Thanks to NSHipster for the explanation
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            print("It's a subclass...Exiting :/")
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector2 = Selector("preferredStatusBarStyle")
            let swizzledSelector2 = Selector("cham_preferredStatusBarStyle")
            
            let originalMethod2 = class_getInstanceMethod(self, originalSelector2)
            let swizzledMethod2 = class_getInstanceMethod(self, swizzledSelector2)
            
            let didAddMethod2 = class_addMethod(self, originalSelector2,
                method_getImplementation(swizzledMethod2),
                method_getTypeEncoding(swizzledMethod2))
            
            if didAddMethod2 {
                class_replaceMethod(self, swizzledSelector2, method_getImplementation(originalMethod2), method_getTypeEncoding(originalMethod2))
            } else {
                method_exchangeImplementations(originalMethod2, swizzledMethod2)
            }
        }
    }
}

extension UIViewController {
    
    private struct AssociatedKeys {
        static var ShouldContrast        = "cham_ShouldContrast"
        static var ShouldUseLightContent = "cham_ShouldUseLightContent"
    }
    
    var shouldContrast: Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ShouldContrast) as? Bool
        }
        set {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.ShouldContrast,
                newValue as Bool?,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    var shouldUseLightContent: Bool? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ShouldUseLightContent) as? Bool
        }
        set {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.ShouldUseLightContent,
                newValue as Bool?,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    func cham_preferredStatusBarStyle() -> UIStatusBarStyle {
        cham_preferredStatusBarStyle()
    
        if let shouldContrast = shouldContrast where shouldContrast == true {
            let statusBarFrame = UIApplication.sharedApplication().statusBarFrame
            let topView = view.findTopMostViewForPoint(CGPointMake(CGRectGetMidX(statusBarFrame), 2))
            
            return topView.backgroundColor!.contrastingStatusBarStyle()
        } else {
            if let shouldUseLightContent = shouldUseLightContent where shouldUseLightContent == true {
                return .LightContent
            } else {
                return .Default
            }
        }
    }
    
    
    public func setStatusBarStyle(statusBarStyle:UIStatusBarStyle) {
        if statusBarStyle == UIStatusBarStyle.Contrast {
            performSelector(Selector("setNeedsStatusBarAppearanceUpdate"), withObject:nil, afterDelay:0.01)
            shouldContrast = true
        } else {
            if statusBarStyle == .LightContent {
                performSelector(Selector("setNeedsStatusBarAppearanceUpdate"), withObject:nil, afterDelay:0.01)
                shouldUseLightContent = true
            } else {
                performSelector(Selector("setNeedsStatusBarAppearanceUpdate"), withObject:nil, afterDelay:0.01)
                shouldUseLightContent = false
            }
        }
        
        preferredStatusBarStyle()
    }
}