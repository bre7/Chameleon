//
//  UIButton+Chameleon.m
//  Chameleon
//
//  Created by Vicc Alexander on 9/20/15.
//  Copyright © 2015 Vicc Alexander. All rights reserved.
//

import UIKit

public extension UIButton {
    
    func setSubstituteFontName(name: String)  {
        guard let currentFontSize = titleLabel?.font.pointSize,
            newFont = UIFont(name: name, size: currentFontSize)
            else { return }
        
        self.titleLabel?.font = newFont
    }
}
