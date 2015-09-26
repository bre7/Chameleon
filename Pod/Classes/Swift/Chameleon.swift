//
//  Chameleon.swift
//  ChamTest
//
//  Created by Vicc Alexander on 9/23/15.
//  Copyright © 2015 Vicc Alexander. All rights reserved.
//

import Foundation
import UIKit

class Chameleon {
    static var application:UIApplication = {
        return UIApplication.sharedApplication()
        }()
    
    /**
    *  Set a global theme using a primary color.
    *
    *  @param primaryColor The primary color to theme all controllers with.
    *  @param contentStyle The contentStyle.
    *
    *  @note By default the secondary color will be a darker shade of the specified primary color.
    *
    *  @since 2.0
    */
    class func setGlobalThemeUsingPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        
        if contentStyle == .Contrast {
            if ContrastColor(primaryColor, true).isEqual(FlatWhite()) {
                application.statusBarStyle = .LightContent
            } else {
                application.statusBarStyle = .Default
            }
        } else {
            if contentStyle == .Light {
                application.statusBarStyle = .LightContent
            } else {
                application.statusBarStyle = .Default
            }
        }
        
        customizeBarButtonItemWithPrimaryColor(primaryColor, contentStyle:contentStyle)
        customizeButtonWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeNavigationBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizePageControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeProgressViewWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSearchBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSegmentedControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSliderWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeStepperWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSwitchWithPrimaryColor(primaryColor)
        customizeTabBarWithBarTintColor(FlatWhite(), andTintColor:primaryColor)
        customizeToolbarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        
    }
    
    /**
    *  Set a global theme using a primary color.
    *
    *  @param primaryColor   The primary color to theme all controllers with.
    *  @param secondaryColor The secondary color to theme all controllers with.
    *  @param contentStyle   The contentStyle.
    *
    *  @since 2.0
    */
    class func setGlobalThemeUsingPrimaryColor(primaryColor: UIColor, withSecondaryColor secondaryColor: UIColor, andContentStyle contentStyle: UIContentStyle) {
        
        if contentStyle == .Contrast {
            if ContrastColor(primaryColor,true).isEqual(FlatWhite()) {
                application.statusBarStyle = .LightContent
            } else {
                application.statusBarStyle = .Default
            }
        } else {
            if contentStyle == .Light {
                application.statusBarStyle = .LightContent
            } else {
                application.statusBarStyle = .Default
            }
        }
        
        customizeBarButtonItemWithPrimaryColor(primaryColor, contentStyle:contentStyle)
        customizeButtonWithPrimaryColor(primaryColor, secondaryColor:secondaryColor, withContentStyle:contentStyle)
        customizeNavigationBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizePageControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeProgressViewWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        customizeSearchBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSegmentedControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSliderWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        customizeStepperWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSwitchWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        customizeTabBarWithBarTintColor(FlatWhite(), andTintColor:primaryColor)
        customizeToolbarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        
    }
    
    /**
    *  Set a global theme using a primary color.
    *
    *  @param primaryColor   The primary color to theme all controllers with.
    *  @param secondaryColor The secondary color to theme all controllers with.
    *  @param fontName       The default font for all text-based UI elements.
    *  @param contentStyle   The contentStyle.
    *
    *  @since 2.0
    */
    class func setGlobalThemeUsingPrimaryColor(primaryColor: UIColor, withSecondaryColor secondaryColor: UIColor, usingfontName fontName: String, andContentStyle contentStyle: UIContentStyle) {
        
        if contentStyle == .Contrast {
            if ContrastColor(primaryColor,true).isEqual(FlatWhite()) {
                application.statusBarStyle = .LightContent
                
            } else {
                application.statusBarStyle = .Default
                
            }
            
        } else {
            if contentStyle == .Light {
                application.statusBarStyle = .LightContent
                
            } else {
                application.statusBarStyle = .Default
                
            }
            
        }
        UILabel.appearance().setSubstituteFontName(fontName)
        UIButton.appearance().setSubstituteFontName(fontName)
        customizeNavigationBarWithBarColor(primaryColor, textColor:ContrastColor(primaryColor,true), fontName:fontName, fontSize:20, buttonColor:ContrastColor(primaryColor,true))
        customizeBarButtonItemWithPrimaryColor(primaryColor, fontName:fontName, fontSize:18, contentStyle:contentStyle)
        customizeSegmentedControlWithPrimaryColor(primaryColor, withfontName:fontName, withfontSize:14, withContentStyle:contentStyle)
        customizeButtonWithPrimaryColor(primaryColor, secondaryColor:secondaryColor, withContentStyle:contentStyle)
        customizePageControlWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeProgressViewWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        customizeSearchBarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSliderWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        customizeStepperWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
        customizeSwitchWithPrimaryColor(primaryColor, andSecondaryColor:secondaryColor)
        customizeTabBarWithBarTintColor(FlatWhite(), andTintColor:primaryColor)
        customizeToolbarWithPrimaryColor(primaryColor, withContentStyle:contentStyle)
    }
    
    // MARK: - UIBarButtonItem
    private class func customizeBarButtonItemWithPrimaryColor(primaryColor: UIColor, contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIBarButtonItem.appearance().tintColor = primaryColor
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = contentColor
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = contentColor
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = contentColor
        
    }
    
    private class func customizeBarButtonItemWithPrimaryColor(primaryColor: UIColor, fontName: String, fontSize: Float, contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIBarButtonItem.appearance().tintColor = primaryColor
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = contentColor
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = contentColor
        UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = contentColor
        
        if let font = UIFont(name:fontName, size:CGFloat(fontSize)) {
            UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).setTitleTextAttributes([NSForegroundColorAttributeName:contentColor, NSFontAttributeName:font], forState: .Normal)
        }
        
    }
    
    // MARK: - UIButton
    private class func customizeButtonWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIButton.appearance().tintColor = contentColor
        UIButton.appearance().backgroundColor = primaryColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = contentColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = contentColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = contentColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).tintColor = primaryColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).backgroundColor = ClearColor()
        UIButton.appearance().setTitleShadowColor(ClearColor(), forState:.Normal)
    }
    
    private class func customizeButtonWithPrimaryColor(primaryColor: UIColor, secondaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor          = colorForContentStyle(contentStyle, baseColor: primaryColor)
        let secondaryContentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIButton.appearance().tintColor = secondaryContentColor
        UIButton.appearance().backgroundColor = secondaryColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = contentColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = contentColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = contentColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).backgroundColor = ClearColor()
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).tintColor = primaryColor
        UIButton.appearanceWhenContainedInInstancesOfClasses([UIStepper.self]).backgroundColor = ClearColor()
        UIButton.appearance().setTitleShadowColor(ClearColor(), forState:.Normal)
        
    }
    
    // MARK: - UILabel
    private class func customizeLabelWithPrimaryColor(primaryColor: UIColor, fontName: String, fontSize: CGFloat, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UILabel.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).textColor = contentColor
        UILabel.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).textColor = contentColor

        if let font = UIFont(name:fontName, size:fontSize) {
            UILabel.appearance().font = font
            UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).font = UIFont(name:fontName, size:14)!
            UILabel.appearanceWhenContainedInInstancesOfClasses([UIButton.self]).font = UIFont(name:fontName, size:18)!
        }
        
    }
    
    // MARK: - UINavigationBar
    private class func customizeNavigationBarWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UINavigationBar.appearance().barTintColor = primaryColor
        UINavigationBar.appearance().tintColor = contentColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : contentColor]
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(nil, forBarMetrics:.Default)
        
    }
    
    private class func customizeNavigationBarWithBarColor(barColor: UIColor, textColor: UIColor, buttonColor: UIColor) {
        UINavigationBar.appearance().barTintColor = barColor
        UINavigationBar.appearance().tintColor = buttonColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : textColor]
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics:.Default)
        
    }
    
    private class func customizeNavigationBarWithBarColor(barColor: UIColor, textColor: UIColor, fontName: String, fontSize: CGFloat, buttonColor: UIColor) {
        UINavigationBar.appearance().barTintColor = barColor
        UINavigationBar.appearance().tintColor = buttonColor
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics:.Default)
        
        if let font = UIFont(name:fontName, size:fontSize) {
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:textColor, NSFontAttributeName:font]
        }
    }
    
    // MARK: - UIPageControl
    private class func customizePageControlWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIPageControl.appearance().currentPageIndicatorTintColor = primaryColor
        UIPageControl.appearance().pageIndicatorTintColor = primaryColor.colorWithAlphaComponent(0.4)
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).pageIndicatorTintColor = contentColor
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).pageIndicatorTintColor = contentColor.colorWithAlphaComponent(0.4)
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).pageIndicatorTintColor = contentColor
        UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).pageIndicatorTintColor = contentColor.colorWithAlphaComponent(0.4)
    }
    
    // MARK: - UIProgressView
    private class func customizeProgressViewWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIProgressView.appearance().progressTintColor = primaryColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).progressTintColor = contentColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).progressTintColor = contentColor
        UIProgressView.appearance().trackTintColor = .lightGrayColor()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    private class func customizeProgressViewWithPrimaryColor(primaryColor: UIColor, andSecondaryColor secondaryColor: UIColor) {
        
        UIProgressView.appearance().progressTintColor = secondaryColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).progressTintColor = secondaryColor
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).progressTintColor = secondaryColor
        UIProgressView.appearance().trackTintColor = .lightGrayColor()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UIProgressView.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).trackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    // MARK: - UISearchBar
    private class func customizeSearchBarWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISearchBar.appearance().barTintColor = primaryColor
        UISearchBar.appearance().backgroundColor = primaryColor
        UISearchBar.appearance().tintColor = contentColor
        UISearchBar.appearance().setBackgroundImage(UIImage(), forBarPosition:.Any, barMetrics:.Default)
        
    }
    
    // MARK: - UISegmentedControl
    private class func customizeSegmentedControlWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISegmentedControl.appearance().tintColor = primaryColor
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = contentColor
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = contentColor
        
    }
    
    private class func customizeSegmentedControlWithPrimaryColor(primaryColor: UIColor, withfontName fontName: String, withfontSize fontSize: Float, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISegmentedControl.appearance().tintColor = primaryColor
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = contentColor
        UISegmentedControl.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = contentColor

        if let font = UIFont(name:fontName, size:CGFloat(fontSize)) {
            UISegmentedControl.appearance().setTitleTextAttributes([NSFontAttributeName:font], forState:.Normal)
            
        }
        
    }
    
    // MARK: - UISlider
    private class func customizeSliderWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UISlider.appearance().minimumTrackTintColor = primaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).minimumTrackTintColor = contentColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).minimumTrackTintColor = contentColor
        UISlider.appearance().maximumTrackTintColor = UIColor.lightGrayColor()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISlider.appearance().thumbTintColor = primaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).thumbTintColor = contentColor
        
    }
    
    private class func customizeSliderWithPrimaryColor(primaryColor: UIColor, andSecondaryColor secondaryColor: UIColor) {
        UISlider.appearance().minimumTrackTintColor = secondaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).minimumTrackTintColor = secondaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).minimumTrackTintColor = secondaryColor
        UISlider.appearance().maximumTrackTintColor = UIColor.lightGrayColor()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).maximumTrackTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISlider.appearance().thumbTintColor = secondaryColor
        UISlider.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).thumbTintColor = ContrastColor(primaryColor,false)
        
    }
    
    // MARK: - UIStepper
    private class func customizeStepperWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIStepper.appearance().tintColor = primaryColor
        UIStepper.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).tintColor = contentColor
        UIStepper.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).tintColor = contentColor
        
    }
    
    // MARK: - UISwitch
    private class func customizeSwitchWithPrimaryColor(primaryColor: UIColor) {
        UISwitch.appearance().onTintColor = primaryColor
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).onTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).onTintColor = primaryColor.darkenByPercentage(0.25).flatten()
        
    }
    
    private class func customizeSwitchWithPrimaryColor(primaryColor: UIColor, andSecondaryColor secondaryColor: UIColor) {
        UISwitch.appearance().onTintColor = secondaryColor
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UINavigationBar.self]).onTintColor = secondaryColor
        UISwitch.appearanceWhenContainedInInstancesOfClasses([UIToolbar.self]).onTintColor = secondaryColor
        
    }
    
    // MARK: - UITabBar
    private class func customizeTabBarWithBarTintColor(barTintColor: UIColor, andTintColor tintColor: UIColor) {
        UITabBar.appearance().barTintColor = barTintColor
        UITabBar.appearance().tintColor = tintColor
        
    }
    
    private class func customizeTabBarWithBarTintColor(barTintColor: UIColor, tintColor: UIColor, fontName: String, fontSize: CGFloat) {
        UITabBar.appearance().barTintColor = barTintColor
        UITabBar.appearance().tintColor = tintColor

        if let font = UIFont(name:fontName, size:fontSize) {
            UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:font], forState:.Normal)
        }
    }
    
    // MARK: - UIToolbar
    private class func customizeToolbarWithPrimaryColor(primaryColor: UIColor, withContentStyle contentStyle: UIContentStyle) {
        let contentColor = colorForContentStyle(contentStyle, baseColor: primaryColor)
        
        UIToolbar.appearance().tintColor = contentColor
        UIToolbar.appearance().barTintColor = primaryColor
        UIToolbar.appearance().clipsToBounds = true
        
    }
    
    class func colorForContentStyle(contentStyle: UIContentStyle, baseColor: UIColor) -> UIColor {
        switch contentStyle {
        case .Contrast:
            return ContrastColor(baseColor, false)
        case .Light:
            return .whiteColor()
        case .Dark:
            return FlatBlackDark()
        }
    }
}
