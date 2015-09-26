//
//  UIView+ChameleonPrivate.m
//  Chameleon
//
//  Created by Vicc Alexander on 6/4/15.
//  Copyright (c) 2015 Vicc Alexander. All rights reserved.
//

import UIKit

public extension UIView {
    
    var isTopViewInWindow: Bool {
        guard let window = self.window else { return false }
        
        let centerPointInSelf = CGPointMake(CGRectGetMidX(self.bounds),
            CGRectGetMidY(self.bounds))
        
        let centerPointOfSelfInWindow = self.convertPoint(centerPointInSelf,
            toView:window)
        
        let view = window.findTopMostViewForPoint(centerPointOfSelfInWindow)
        let isTopMost = view == self || view.isDescendantOfView(self)
        
        return isTopMost
    }
    
    func findTopMostViewForPoint(point: CGPoint) -> UIView {
        for currentSubView in self.subviews where !currentSubView.hidden &&
            CGRectContainsPoint(currentSubView.frame, point) &&
            currentSubView.alpha > 0.01 {
                
                let pointConverted = self.convertPoint(point, toView:currentSubView)
                return currentSubView.findTopMostViewForPoint(pointConverted)
        }
        
        return self
    }
    
}
