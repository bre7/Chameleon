//
//  UIColor+ChameleonPrivate.m
//  Chameleon
//
//  Created by Vicc Alexander on 6/6/15.
//  Copyright (c) 2015 Vicc Alexander. All rights reserved.
//

import UIKit

public func RGB(red:CGFloat, _ green:CGFloat, _ blue:CGFloat) -> UIColor {
    return RGBa(red, green, blue, 1.0)
}

public func RGBa(red:CGFloat, _ green:CGFloat, _ blue:CGFloat, _ alpha:CGFloat) -> UIColor {
    return UIColor(red:red/255.0, green:green/255.0, blue:blue/255.0, alpha:alpha)
}

public func HSBa(hue: CGFloat, _ saturation: CGFloat, _ brightness: CGFloat, _ alpha: CGFloat) -> UIColor {
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
}

public func HSB(hue: CGFloat, _ saturation: CGFloat, _ brightness: CGFloat) -> UIColor {
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
}

extension UIColor {
    convenience init(rgba: rgbaTuple) {
        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
    
    convenience init(hsba: hsbTuple) {
        self.init(hue: hsba.h, saturation: hsba.s, brightness: hsba.b, alpha: hsba.a)
    }
    
    convenience init(image: UIImage, atPoint point:CGPoint) {
        self.init(rgba: image.getPixelColor(point).getRGBA())
    }
    
    func colorWithMinimumSaturation(saturation: CGFloat) -> UIColor {
        let hsba = getHSBA()
        
        if hsba.s < saturation {
            return UIColor(hsba: hsba)
        }
        return self
    }
    
    // Equatable ?
    func isDistinct(color: UIColor) -> Bool {
        let rgbaSelf = getRGBA()
        let rgbaColor = color.getRGBA()
        
        let threshold:CGFloat = 0.25
        
        if fabs(rgbaSelf.r - rgbaColor.r) > threshold ||
            fabs(rgbaSelf.g - rgbaColor.g) > threshold ||
            fabs(rgbaSelf.b - rgbaColor.b) > threshold ||
            fabs(rgbaSelf.a - rgbaColor.a) > threshold {
                
                // Check for grays
                if rgbaSelf.r - rgbaSelf.g < 0.03 && fabs(rgbaSelf.r - rgbaSelf.b) < 0.03 {
                    if fabs(rgbaSelf.r - rgbaSelf.g) < 0.03 && fabs(rgbaSelf.r - rgbaSelf.b) < 0.03 {
                        return false
                    }
                }
                
                return true
        }
        
        return false
    }
    
    // MARK: - Helpers
    // Thanks to https://github.com/bennyguitar/Colours for the Swift version
    
    func getRGBA(normalized: Bool = false) -> rgbaTuple {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if self.respondsToSelector("getRed:green:blue:alpha:") {
            self.getRed(&r, green: &g, blue: &b, alpha: &a)
        } else {
            let components = CGColorGetComponents(self.CGColor)
            r = components[0]
            g = components[1]
            b = components[2]
            a = components[3]
        }
        
        if normalized {
            return (r * 255, g * 255, b * 255, a)
        }
        return (r, g, b, a)
    }
    
    func getHSBA(normalized: Bool = false) -> hsbTuple {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if self.respondsToSelector("getHue:saturation:brightness:alpha:") {
            self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        }
        
        if normalized {
            return (h * 360, s * 100, b * 100, a)
        }
        return (h, s, b, a)
    }
    
    func getXYZ() -> xyzTuple {
        // Get RGBA values
        let rgbaT = getRGBA()
        
        // Transfrom values to XYZ
        let deltaR: (CGFloat) -> CGFloat = { R in
            if R > 0.04045 {
                return pow((R + 0.055)/1.055, 2.40)
            } else {
                return R / 12.92
            }
        }
        let R = deltaR(rgbaT.r)
        let G = deltaR(rgbaT.g)
        let B = deltaR(rgbaT.b)
        let X = (R*41.24 + G*35.76 + B*18.05)
        let Y = (R*21.26 + G*71.52 + B*7.22)
        let Z = (R*1.93 + G*11.92 + B*95.05)
        
        return (X, Y, Z, rgbaT.a)
    }
    
    func getLAB() -> labTuple {
        // Get XYZ
        let xyzT = getXYZ()
        let x = xyzT.X/95.047
        let y = xyzT.Y/100.000
        let z = xyzT.Z/108.883
        
        // Transfrom XYZ to L*a*b
        let deltaF: (CGFloat) -> CGFloat = { f in
            let transformation = (f > pow((6.0/29.0), 3.0)) ? pow(f, 1.0/3.0) : (1/3) * pow((29.0/6.0), 2.0) * f + 4/29.0
            
            return transformation
        }
        let X = deltaF(x)
        let Y = deltaF(y)
        let Z = deltaF(z)
        let L = 116*Y - 16
        let a = 500 * (X - Y)
        let b = 200 * (Y - Z)
        
        return (L, a, b, xyzT.a)
    }
    
    var luminance: CGFloat {
        //Check for clear or uncalculatable color and assume white
        //        if (![backgroundColor getRed:&red green:&green blue:&blue alpha:nil]) {
        //            return UIStatusBarStyleDefault;
        //        }
        
        let originalRGBA = getRGBA()
        //Relative luminance in colorimetric spaces - http://en.wikipedia.org/wiki/Luminance_(relative)
        let rgb = (originalRGBA.r * 0.2126, originalRGBA.g * 0.7152, originalRGBA.b * 0.0722)
        
        return rgb.0 + rgb.1 + rgb.2
    }
}
