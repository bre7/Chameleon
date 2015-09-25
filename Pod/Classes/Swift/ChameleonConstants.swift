/*

The MIT License (MIT)

Copyright (c) 2014-2015 Vicc Alexander.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

import UIKit

let UIStatusBarStyleContrast = UIStatusBarStyle(rawValue: 100)!

/**
*  A contrasting status bar, intended for use on any backgrounds.
*
*  @since 2.0
*/
struct ChameleonConstants {
    static let numberOfPossibleColors = 48
    
    // MARK: - Chameleon - Light Shades
    static var flatBlackColor = {
        return HSB(0,0,17)
    }()
    
    static var flatBlueColor = {
        return HSB(224,50,63)
        
    }()
    
    static var flatBrownColor = {
        return HSB(24,45,37)
        
    }()
    
    static var flatCoffeeColor = {
        return HSB(25,31,64)
        
    }()
    
    static var flatForestGreenColor = {
        return HSB(138,45,37)
        
    }()
    
    static var flatGrayColor = {
        return HSB(184,10,65)
        
    }()
    
    static var flatGreenColor = {
        return HSB(145,77,80)
        
    }()
    
    static var flatLimeColor = {
        return HSB(74,70,78)
        
    }()
    
    static var flatMagentaColor = {
        return HSB(283,51,71)
        
    }()
    
    static var flatMaroonColor = {
        return HSB(5,65,47)
        
    }()
    
    static var flatMintColor = {
        return HSB(168,86,74)
        
    }()
    
    static var flatNavyBlueColor = {
        return HSB(210,45,37)
        
    }()
    
    static var flatOrangeColor = {
        return HSB(28,85,90)
        
    }()
    
    static var flatPinkColor = {
        return HSB(324,49,96)
        
    }()
    
    static var flatPlumColor = {
        return HSB(300,45,37)
        
    }()
    
    static var flatPowderBlueColor = {
        return HSB(222,24,95)
        
    }()
    
    static var flatPurpleColor = {
        return HSB(253,52,77)
        
    }()
    
    static var flatRedColor = {
        return HSB(6,74,91)
        
    }()
    
    static var flatSandColor = {
        return HSB(42,25,94)
        
    }()
    
    static var flatSkyBlueColor = {
        return HSB(204,76,86)
        
    }()
    
    static var flatTealColor = {
        return HSB(195,55,51)
        
    }()
    
    static var flatWatermelonColor = {
        return HSB(356,53,94)
        
    }()
    
    static var flatWhiteColor = {
        return HSB(192,2,95)
        
    }()
    
    static var flatYellowColor = {
        return HSB(48,99,100)
        
    }()
    
    // MARK: - Chameleon - Dark Shades
    static var flatBlackColorDark = {
        return HSB(0,0,15)
        
    }()
    
    static var flatBlueColorDark = {
        return HSB(224,56,51)
        
    }()
    
    static var flatBrownColorDark = {
        return HSB(25,45,31)
        
    }()
    
    static var flatCoffeeColorDark = {
        return HSB(25,34,56)
        
    }()
    
    static var flatForestGreenColorDark = {
        return HSB(135,44,31)
        
    }()
    
    static var flatGrayColorDark = {
        return HSB(184,10,55)
        
    }()
    
    static var flatGreenColorDark = {
        return HSB(145,78,68)
        
    }()
    
    static var flatLimeColorDark = {
        return HSB(74,81,69)
        
    }()
    
    static var flatMagentaColorDark = {
        return HSB(282,61,68)
        
    }()
    
    static var flatMaroonColorDark = {
        return HSB(4,68,40)
        
    }()
    
    static var flatMintColorDark = {
        return HSB(168,86,63)
        
    }()
    
    static var flatNavyBlueColorDark = {
        return HSB(210,45,31)
        
    }()
    
    static var flatOrangeColorDark = {
        return HSB(24,100,83)
        
    }()
    
    static var flatPinkColorDark = {
        return HSB(327,57,83)
        
    }()
    
    static var flatPlumColorDark = {
        return HSB(300,46,31)
        
    }()
    
    static var flatPowderBlueColorDark = {
        return HSB(222,28,84)
        
    }()
    
    static var flatPurpleColorDark = {
        return HSB(253,56,64)
        
    }()
    
    static var flatRedColorDark = {
        return HSB(6,78,75)
        
    }()
    
    static var flatSandColorDark = {
        return HSB(42,30,84)
        
    }()
    
    static var flatSkyBlueColorDark = {
        return HSB(204,78,73)
        
    }()
    
    static var flatTealColorDark = {
        return HSB(196,54,45)
        
    }()
    
    static var flatWatermelonColorDark = {
        return HSB(358,61,85)
        
    }()
    
    static var flatWhiteColorDark = {
        return HSB(204,5,78)
        
    }()
    
    static var flatYellowColorDark = {
        return HSB(40,100,100)
        
    }()
}
