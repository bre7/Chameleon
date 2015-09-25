//
//  UILabel+Chameleon.m
//  Chameleon
//
//  Created by Vicc Alexander on 9/20/15.
//  Copyright © 2015 Vicc Alexander. All rights reserved.
//

import UIKit

extension UILabel {

    func setSubstituteFontName(name: String)  {
        self.font = UIFont(name:name, size:self.font.pointSize)
    }
}
