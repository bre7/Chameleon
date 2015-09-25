
//  NSArray+Chameleon.m

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

public typealias rgbaTuple = (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
public typealias labTuple  = (L: CGFloat, A: CGFloat, B: CGFloat, a: CGFloat)
public typealias hsbTuple  = (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat)
public typealias xyzTuple  = (X: CGFloat, Y: CGFloat, Z: CGFloat, a: CGFloat)

extension UIColor {
    
    /**
    *  Creates and returns a flat color object closest to the specified color in the LAB colorspace.
    *
    *  @return A flat version of the specified @c UIColor.
    *
    *  @since 2.0
    */
    func flatten() -> UIColor {
        //Find the nearest flat color
        return nearestFlatColorForLAB()
    }
    
    var isMonochromeOrRGB: Bool {
        let model = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor))
        
        return [.RGB, .Monochrome].contains(model)
    }
    
    var RGBAValue: Int {
        let rgba = getRGBAComponents()
        let red   = Int(rgba.r * 255)
        let green = Int(rgba.g * 255)
        let blue  = Int(rgba.b * 255)
        let alpha = Int(rgba.a * 255)
        
        return (red << 24) + (green << 16) + (blue << 8) + alpha
    }
    
    /**
    *  Creates and returns a @c UIColor object based on the specified hex string.
    *
    *  @param string The hex string.
    *  @param alpha  The opacity.
    *
    *  @return A @c UIColor object in the RGB colorspace.
    *
    *
    *  @since 2.0
    */
    convenience init?(hexString: String, withAlpha alpha: CGFloat? = 1.0) {
        guard !hexString.characters.isEmpty else { return nil }
        
        let hasPrefix = hexString.hasPrefix("#")
        let charCount = hasPrefix ? hexString.characters.count - 1 : hexString.characters.count
        guard [3 , 4, 6, 8].contains(charCount) else { return nil }
        
        let string:String
        if !hasPrefix {
            string = "#" + hexString
        } else {
            string = hexString
        }
        
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        let index   = string.startIndex.advancedBy(1)
        let hex     = string.substringFromIndex(index)
        let scanner = NSScanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexLongLong(&hexValue) {
            switch (hex.characters.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
            }
        } else {
            print("Scan hex error")
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    class func hexValueToUnsigned(hexValue: String) -> Int {
        var value: UInt32 = 0
        let hexValueScanner = NSScanner(string: hexValue)
        hexValueScanner.scanHexInt(&value)
        
        return Int(value)
    }
    
    // MARK: - Chameleon - Random Color Methods
    class func generateRandomNumberWithMax(max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
    
    /**
    *  Returns a randomly generated flat color object whose alpha value is 1.0.
    *
    *  @return A flat @c UIColor object in the HSB colorspace.
    *
    *  @since 1.0
    */
    class func randomFlatColor() -> UIColor {
        let defaults    = NSUserDefaults.standardUserDefaults()
        let defaultsKey = "previousRandomNumber"
        var randomColorChosen = generateRandomNumberWithMax(ChameleonConstants.numberOfPossibleColors)
        
        if let previousRand = defaults.objectForKey(defaultsKey) as? Int {
            while randomColorChosen == previousRand {
                randomColorChosen = generateRandomNumberWithMax(ChameleonConstants.numberOfPossibleColors)
            }
        }
        
        defaults.setInteger(randomColorChosen, forKey:defaultsKey)
        defaults.synchronize()
        
        return flatColors()[randomColorChosen]
    }
    
    // MARK: - Chameleon Instance Methods
    
    /**
    *  Creates and returns a darker shade of a specified color in the HSB space.
    *
    *  @param percentage The value with which to darken a specified color.
    *
    *  @return A @c UIColor object in the HSB space.
    *
    *  @since 2.0
    */
    func darkenByPercentage(percentage: CGFloat) -> UIColor {
        let hsba = getHSBA()
        
        var newB = hsba.b
        if percentage > 0 {
            newB = min(newB - percentage, 1.0)
        }
        
        return RGBa(hsba.h, hsba.s, newB, hsba.a)
    }
    
    /**
    *  Creates and returns a lighter shade of a specified color in the HSB space.
    *
    *  @param percentage The value with which to lighten a specified color.
    *
    *  @return A @c UIColor object in the HSB space.
    *
    *  @since 2.0
    */
    func lightenByPercentage(percentage: CGFloat) -> UIColor {
        let hsba = getHSBA()
        
        var newB = hsba.b
        if percentage > 0 {
            newB = min(newB + percentage, 1.0)
        }
        
        return RGBa(hsba.h, hsba.s, newB, hsba.a)
    }
    
    func isEqualToColor(color: UIColor) -> Bool {
        if self.isMonochromeOrRGB && color.isMonochromeOrRGB {
            return self.RGBAValue == color.RGBAValue
        }
        
        return self.isEqual(color)
    }
    
    // MARK: - Chameleon Internal Methods
    class func flatColors() -> [UIColor] {
        return [FlatBlack(),FlatBlackDark(),FlatBlue(),FlatBlueDark(),FlatBrown(),FlatBrownDark(),FlatCoffee(),FlatCoffeeDark(),FlatForestGreen(),FlatForestGreenDark(),FlatGray(),FlatGrayDark(),FlatGreen(),FlatGreenDark(),FlatLime(),FlatLimeDark(),FlatMagenta(),FlatMagentaDark(),FlatMaroon(),FlatMaroonDark(),FlatMint(),FlatMintDark(),FlatNavyBlue(),FlatNavyBlueDark(),FlatOrange(),FlatOrangeDark(),FlatPink(),FlatPinkDark(),FlatPlum(),FlatPlumDark(),FlatPowderBlue(),FlatPowderBlueDark(),FlatPurple(),FlatPurpleDark(),FlatRed(),FlatRedDark(),FlatSand(),FlatSandDark(),FlatSkyBlue(),FlatSkyBlueDark(),FlatTeal(),FlatTealDark(),FlatWatermelon(),FlatWatermelonDark(),FlatWhite(),FlatWhiteDark(),FlatYellow(),FlatYellowDark()]
    }
    
    class func flatLightColors() -> [UIColor] {
        return [FlatBlack(),FlatBlue(),FlatBrown(),FlatCoffee(),FlatForestGreen(),FlatGray(),FlatGreen(),FlatLime(),FlatMagenta(),FlatMaroon(),FlatMint(),FlatNavyBlue(),FlatOrange(),FlatPink(),FlatPlum(),FlatPowderBlue(),FlatPurple(),FlatRed(),FlatSand(),FlatSkyBlue(),FlatTeal(),FlatWatermelon(),FlatWhite(),FlatYellow()]
    }
    
    class func flatDarkColors() -> [UIColor] {
        return [FlatBlackDark(),FlatBlueDark(),FlatBrownDark(),FlatCoffeeDark(),FlatForestGreenDark(),FlatGrayDark(),FlatGreenDark(),FlatLimeDark(),FlatMagentaDark(),FlatMaroonDark(),FlatMintDark(),FlatNavyBlueDark(),FlatOrangeDark(),FlatPinkDark(),FlatPlumDark(),FlatPowderBlueDark(),FlatPurpleDark(),FlatRedDark(),FlatSandDark(),FlatSkyBlueDark(),FlatTealDark(),FlatWatermelonDark(),FlatWhiteDark(),FlatYellowDark()]
    }
    
    // Calculate the total sum of differences - Euclidian distance
    // Chameleon is now using the CIEDE2000 formula to calculate distances between 2 colors.
    // More info: http://en.wikipedia.org/wiki/Color_difference
    func totalSumOfLABDifferences(tuple: labTuple) -> Float {
        let tuple_aux = self.getLAB()
        let tuple1 = (L: Float(tuple_aux.L), A: Float(tuple_aux.A), B: Float(tuple_aux.B), alpha: Float(tuple_aux.a))
        let tuple2 = (L: Float(tuple.L), A: Float(tuple.A), B: Float(tuple.B), alpha: Float(tuple.a))
        
        let magicNumber = Float(360.0*M_PI/180)
        let C1 = sqrt(pow(tuple1.A,2) + pow(tuple1.B,2))
        let C2 = sqrt(pow(tuple2.A,2) + pow(tuple2.B,2))
        let KL = Float(1)
        let KC = Float(1)
        let KH = Float(1)
        let DeltaPrimeL = tuple2.L - tuple1.L
        let MeanL = (tuple1.L + tuple2.L)/2
        let MeanC = (C1 + C2)/2
        let A1Prime = tuple1.A + tuple1.A / 2 * (1-sqrt(pow(MeanC,7.0)/(pow(MeanC,7.0)+pow(25.0,7.0))))
        let A2Prime = tuple2.A + tuple2.A / 2 * (1-sqrt(pow(MeanC,7.0)/(pow(MeanC,7.0)+pow(25.0,7.0))))
        let C1Prime = sqrt(pow(A1Prime,2)+pow(tuple1.B,2))
        let C2Prime = sqrt(pow(A2Prime,2)+pow(tuple2.B,2))
        let DeltaPrimeC = C1Prime-C2Prime
        let DeltaC = C1 - C2
        let MeanCPrime = (C1Prime+C2Prime)/2
        let H1Prime = fmodf(atan2(tuple1.B,A1Prime),magicNumber)
        let H2Prime = fmodf(atan2(tuple2.B,A2Prime),magicNumber)
        var hDeltaPrime:Float = 0
        
        if fabs(H1Prime - H2Prime) <= Float(M_PI) {
            hDeltaPrime = H2Prime - H1Prime
        } else {
            if H2Prime <= H1Prime {
                hDeltaPrime = (H2Prime-H1Prime) + magicNumber
            } else {
                hDeltaPrime = (H2Prime-H1Prime) - magicNumber
            }
        }
        
        let deltaHPrime = 2*(sqrt(C1Prime*C2Prime))*sin(hDeltaPrime/2)

        var MeanHPrime:Float = 0
        if fabs(H1Prime-H2Prime) > Float(M_PI) {
            MeanHPrime = (H1Prime+H2Prime + magicNumber)/2
        } else {
            MeanHPrime = (H1Prime+H2Prime)/2
        }
        
        var T = 1 - 0.17*cos(MeanHPrime-Float(30.0*M_PI/180)) + 0.24*cos(2*MeanHPrime)
        T += 0.32*cos(3*MeanHPrime+Float(6.0*M_PI/180)) - 0.20*cos(4*MeanHPrime-Float(63.0*M_PI/180))
        let SL = 1+(0.015*pow((MeanL-50),2))/sqrt(20+pow((MeanL-50),2))
        let SC = 1+0.045*MeanCPrime
        let SH = 1+0.015*MeanCPrime*T
        var RT = -2*sqrt(pow(MeanCPrime,7)/(pow(MeanCPrime,7)+pow(25.0,7)))
        let RT_aux1 = Float(60.0*M_PI/180)
        let RT_aux2_1 = (MeanCPrime - Float(275.0*M_PI/180)) / Float(25.0*M_PI/180)
        let RT_aux2 = exp(-1 * pow(RT_aux2_1,2))
        RT *= sin(RT_aux1 * RT_aux2)
        
        var TotalDifference = pow((DeltaPrimeL/(KL*SL)),2) + pow((DeltaPrimeC/(KC*SC)),2) + pow((deltaHPrime/(KH*SH)),2)
        TotalDifference += RT*(DeltaC/(KC*SC))*(deltaHPrime/(KH*SH))
        
        return sqrt(TotalDifference)
    }
    
    func nearestFlatColorForLAB() -> UIColor {
        var index = 0
        var smallestDistance: CFloat = 1_000_000
        var previousDistance: CFloat = 1_000_000
        var currentDistance:  CFloat
        
        for i in 0..<self.dynamicType.flatColors().count {
            if i != 0 {
                previousDistance = self.totalSumOfLABDifferences(self.dynamicType.flatColors()[i-1].getLAB())
            }
            
            currentDistance = self.totalSumOfLABDifferences(self.dynamicType.flatColors()[i].getLAB())
            if currentDistance < previousDistance && currentDistance < smallestDistance {
                smallestDistance = currentDistance
                index = i
            }
            
        }
        
        let rgba = self.dynamicType.flatColors()[index].getRGBA()
        return UIColor(rgba: rgba)
    }
    
    func getRGBAComponents() -> rgbaTuple {
        
        let model = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor))
        let components = CGColorGetComponents(self.CGColor)
        
        var rgba: rgbaTuple = (r: 0, g: 0, b: 0, a: 1)
        switch model {
        case .Monochrome:
            rgba.r = components[0]
            rgba.g = components[0]
            rgba.b = components[0]
            rgba.a = components[1]
        case .RGB:
            rgba.r = components[0]
            rgba.g = components[1]
            rgba.b = components[2]
            rgba.a = components[3]
        default:
            #if DEBUG
                NSLog("Unsupported color model: %i", model)
            #endif
        }
        
        return rgba
    }
    
    // MARK: - Chameleon - Internal Color Scheme Methods
    func colorSchemeOfType(type: ColorScheme, flat isFlat: Bool) -> [UIColor] {
        switch type {
        case .Analogous:
            return analogousColorSchemeFromColor(flat: isFlat)
        case .Complementary:
            return complementaryColorSchemeFromColor(flat: isFlat)
        case .Triadic:
            return triadicColorSchemeFromColor(flat: isFlat)
        }
    }
    
    //Creates an array with 2 analagous colors on each side of the predefined color
    func analogousColorSchemeFromColor(flat isFlat:Bool) -> [UIColor] {
        let hsb = getHSBA(true)
        let h = hsb.h
        let s = hsb.s
        let b = hsb.b
        
        var firstColor = UIColor(hue:(-32 +&& h)/360,
            saturation:(s+5)/100,
            brightness:(b+5)/100,
            alpha:1.0)
        
        var secondColor = UIColor(hue:(-16 +&& h)/360,
            saturation:(s+5)/100,
            brightness:(b+9)/100,
            alpha:1.0)
        
        var thirdColor = UIColor(hue:h/360,
            saturation:s/100,
            brightness:b/100,
            alpha:1.0)
        
        var fourthColor = UIColor(hue:(16 +&& h)/360,
            saturation:(s+5)/100,
            brightness:(b+9)/100,
            alpha:1.0)
        
        var fifthColor = UIColor(hue:(32 +&& h)/360,
            saturation:(s+5)/100,
            brightness:(b+5)/100,
            alpha:1.0)
        
        if isFlat {
            //Flatten colors
            firstColor  = firstColor.flatten()
            secondColor = secondColor.flatten()
            thirdColor  = thirdColor.flatten()
            fourthColor = fourthColor.flatten()
            fifthColor  = fifthColor.flatten()
            
            //Make sure returned colors are unique
            
            //Inner Colors
            if secondColor == thirdColor {
                secondColor = UIColor(hue:(-48 +&& h)/360,
                    saturation:(s+5)/100,
                    brightness:(b+9)/100,
                    alpha:1.0).flatten()
            }
            
            if thirdColor == fourthColor {
                fourthColor = UIColor(hue:(32 +&& h)/360,
                    saturation:(s+5)/100,
                    brightness:(b+9)/100,
                    alpha:1.0).flatten()
            }
            
            //Outer Colors
            
            if firstColor == secondColor {
                firstColor = UIColor(hue:(-64 +&& h)/360,
                    saturation:(s+5)/100,
                    brightness:(b+9)/100,
                    alpha:1.0).flatten()
            }
            
            if firstColor == thirdColor {
                firstColor = UIColor(hue:(-96 +&& h)/360,
                    saturation:(s+5)/100,
                    brightness:(b+9)/100,
                    alpha:1.0).darkenByPercentage(0.25)
            }
            
            if fourthColor == fifthColor {
                fifthColor = UIColor(hue:(64 +&& h)/360,
                    saturation:(s+5)/100,
                    brightness:(b+9)/100,
                    alpha:1.0).flatten()
            }
            
            if thirdColor == fifthColor {
                fifthColor = UIColor(hue:(96 +&& h)/360,
                    saturation:(s+5)/100,
                    brightness:(b+9)/100,
                    alpha:1.0).flatten()
            }
            
        }
        
        return [firstColor, secondColor, thirdColor, fourthColor, fifthColor]
    }
    
    // Creates an array of 5 colors, both 90 degrees and 180 degrees away from the predefined colors on both sides
    func complementaryColorSchemeFromColor(flat isFlat:Bool) -> [UIColor] {
        let hsb = getHSBA(true)
        let h = hsb.h
        let s = hsb.s
        let b = hsb.b
        
        var firstColor = UIColor(hue:h/360,
            saturation:(s+5)/100,
            brightness:(b-30)/100,
            alpha:1.0)
        
        var secondColor = UIColor(hue:h/360,
            saturation:(s-10)/100,
            brightness:(b+9)/100,
            alpha:1.0)
        
        var thirdColor = UIColor(hue:h/360,
            saturation:s/100,
            brightness:b/100,
            alpha:1.0)
        
        
        var fourthColor = UIColor(hue:(180 +&& h)/360,
            saturation:s/100,
            brightness:b/100,
            alpha:1.0)
        
        var fifthColor = UIColor(hue:(180 +&& h)/360,
            saturation:(s+20)/100,
            brightness:(b-30)/100,
            alpha:1.0)
        
        
        if isFlat {
            //Flatten colors
            firstColor  = firstColor.flatten()
            secondColor = secondColor.flatten()
            thirdColor  = thirdColor.flatten()
            fourthColor = fourthColor.flatten()
            fifthColor  = fifthColor.flatten()
            
            //Make sure returned colors are unique
            
            //Inner Colors
            if secondColor == thirdColor {
                secondColor = secondColor.darkenByPercentage(0.25).flatten()
            }
            
            if thirdColor == fourthColor {
                fourthColor = fourthColor.darkenByPercentage(0.25).flatten()
            }
            
            if firstColor == thirdColor {
                firstColor = firstColor.darkenByPercentage(0.25).flatten()
            }
            
            if fifthColor == thirdColor {
                fifthColor = fifthColor.darkenByPercentage(0.25).flatten()
            }
            
            //Outer Colors
            
            if firstColor == secondColor {
                firstColor = firstColor.darkenByPercentage(0.25).flatten()
            }
            
            
            if fourthColor == fifthColor {
                fifthColor = fifthColor.darkenByPercentage(0.25).flatten()
            }
            
        }
        
        return [firstColor, secondColor, thirdColor, fourthColor, fifthColor]
        
    }
    
    // Creates an array of 5 colors, both 120 degrees and 240 degrees away from the predefined colors on both sides
    func triadicColorSchemeFromColor(flat isFlat:Bool) -> [UIColor] {
        let hsb = getHSBA(true)
        let h = hsb.h
        let s = hsb.s
        let b = hsb.b
        
        var firstColor = UIColor(hue:(120 +&& h)/360,
            saturation:(7*s/6)/100,
            brightness:(b-5)/100,
            alpha:1.0)
        
        var secondColor = UIColor(hue:(120 +&& h)/360,
            saturation:s/100,
            brightness:(b+9)/100,
            alpha:1.0)
        
        var thirdColor = UIColor(hue:h/360,
            saturation:s/100,
            brightness:b/100,
            alpha:1.0)
        
        var fourthColor = UIColor(hue:(240 +&& h)/360,
            saturation:(7*s/6)/100,
            brightness:(b-5)/100,
            alpha:1.0)
        
        var fifthColor = UIColor(hue:(240 +&& h)/360,
            saturation:s/100,
            brightness:(b-30)/100,
            alpha:1.0)
        
        if isFlat {
            //Flatten colors
            firstColor  = firstColor.flatten()
            secondColor = secondColor.flatten()
            thirdColor  = thirdColor.flatten()
            fourthColor = fourthColor.flatten()
            fifthColor  = fifthColor.flatten()
            
            //Make sure returned colors are unique
            
            //Inner Colors
            if secondColor == thirdColor {
                secondColor = secondColor.darkenByPercentage(0.25).flatten()
            }
            
            if thirdColor == fourthColor {
                fourthColor = fourthColor.darkenByPercentage(0.25).flatten()
            }
            
            if firstColor == thirdColor {
                firstColor = firstColor.darkenByPercentage(0.25).flatten()
            }
            
            if fifthColor == thirdColor {
                fifthColor = fifthColor.darkenByPercentage(0.25).flatten()
            }
            
            //Outer Colors
            
            if firstColor == secondColor {
                firstColor = firstColor.darkenByPercentage(0.25).flatten()
            }
            
            if fourthColor == fifthColor {
                fifthColor = fifthColor.darkenByPercentage(0.25).flatten()
            }
            
        }
        
        return [firstColor, secondColor, thirdColor, fourthColor, fifthColor]
    }
    
    // MARK: - "Color With" Methods
    
    /**
    *  Creates and returns a complementary flat color object 180 degrees away in the HSB colorspace from the specified color.
    *
    *  @param color The color whose complementary color is being requested.
    *  @param alpha The opacity.
    *
    *  @return A flat UIColor object in the HSB colorspace.
    *
    *  @since 2.0
    */
    func complementaryFlatColor(gradientImage:UIImage? = nil) -> UIColor {
        let color: UIColor
        
        //Check if input UIColor is a gradient aka a pattern
        if let gradientImage = gradientImage, _ = CGColorGetPattern(CGColor) {
            //Let's find the average color of the image and contrast against that.
            let size = CGSize(width: 1, height: 1)
            
            //Create a 1x1 bitmap context
            UIGraphicsBeginImageContext(size)
            let ctx = UIGraphicsGetCurrentContext()
            
            //Set the interpolation quality to medium
            CGContextSetInterpolationQuality(ctx, .Medium)
            
            //Draw image scaled down to this 1x1 pixel
            let rect = CGRect(origin: CGPointZero, size: size)
            gradientImage.drawInRect(rect, blendMode: .Copy, alpha: 1)
            
            //Read the RGB values from the context's buffer
            let data = CGBitmapContextGetData(ctx)
            let _data = UnsafePointer<UInt8>(data)
            color = RGBa(CGFloat(_data[2]) / 255, CGFloat(_data[1]) / 255, CGFloat(_data[0]) / 255, 1)
            
            UIGraphicsEndImageContext()
        } else {
            color = self
        }
        
        //Extract & Check to make sure we have an actual color to work with (Clear returns clear)
        var hsba = color.getHSBA()
        
        //Check if color is transparent
        if hsba.a == 0 {
            return .clearColor()
        }
        
        //Multiply our value by their max values to convert
        hsba.h *= 360
        hsba.s *= 100
        hsba.b *= 100
        
        //Select a color with a hue 180 degrees away on the colorwheel (i.e. for 50 it would be 230).
        hsba.h += 180.0
        if hsba.h > 360 {
            hsba.h -= 360.0
        }
        
        //Round to the nearest whole number after multiplying
        hsba.h = round(hsba.h)
        hsba.s = round(hsba.s)
        hsba.b = round(hsba.b)
        
        //Store complimentary nonflat color
        let complimentaryNonFlatColor = HSBa(hsba.h/360, hsba.s/100, hsba.b/100, hsba.a)
        
        //Retrieve LAB values from our complimentary nonflat color & return nearest flat color
        return complimentaryNonFlatColor.flatten()
    }
    
    func flatVersion(gradientImage:UIImage? = nil, withAlpha alpha:CGFloat = 1.0) -> UIColor {
        let color: UIColor
        
        //Check if input UIColor is a gradient aka a pattern
        if let gradientImage = gradientImage, _ = CGColorGetPattern(CGColor) {
            //Let's find the average color of the image and contrast against that.
            let size = CGSize(width: 1, height: 1)
            
            //Create a 1x1 bitmap context
            UIGraphicsBeginImageContext(size)
            let ctx = UIGraphicsGetCurrentContext()
            
            //Set the interpolation quality to medium
            CGContextSetInterpolationQuality(ctx, .Medium)
            
            //Draw image scaled down to this 1x1 pixel
            let rect = CGRect(origin: CGPointZero, size: size)
            gradientImage.drawInRect(rect, blendMode: .Copy, alpha: 1)
            
            //Read the RGB values from the context's buffer
            let data = CGBitmapContextGetData(ctx)
            let _data = UnsafePointer<UInt8>(data)
            color = RGBa(CGFloat(_data[2]) / 255, CGFloat(_data[1]) / 255, CGFloat(_data[0]) / 255, 1)
            
            UIGraphicsEndImageContext()
        } else {
            color = self
        }
        
        //Find the nearest flat color
        return color.nearestFlatColorForLAB()
    }
    
    /**
    *  Creates and returns either a black or white color object depending on which contrasts more with a specified color.
    *
    *  @param color The specified color of the contrast color that is being requested.
    *  @param isFlat Pass YES to return flat color objects.
    *  @param alpha The opacity.
    *
    *  @return A UIColor object in the HSB colorspace.
    *
    *  @since 2.0
    */
    func contrastingBlackOrWhiteColor(gradientImage: UIImage? = nil, isFlat flat:Bool, alpha:CGFloat = 1.0) -> UIColor {
        guard alpha != 0 else { return .clearColor() }
        
        let color: UIColor
        //Check if input UIColor is a gradient aka a pattern
        if let gradientImage = gradientImage, _ = CGColorGetPattern(CGColor) {
            //Let's find the average color of the image and contrast against that.
            let size = CGSize(width: 1, height: 1)
            
            //Create a 1x1 bitmap context
            UIGraphicsBeginImageContext(size)
            let ctx = UIGraphicsGetCurrentContext()
            
            //Set the interpolation quality to medium
            CGContextSetInterpolationQuality(ctx, .Medium)
            
            //Draw image scaled down to this 1x1 pixel
            let rect = CGRect(origin: CGPointZero, size: size)
            gradientImage.drawInRect(rect, blendMode: .Copy, alpha: 1)
            
            //Read the RGB values from the context's buffer
            let data = CGBitmapContextGetData(ctx)
            let _data = UnsafePointer<UInt8>(data)
            color = RGBa(CGFloat(_data[2]) / 255, CGFloat(_data[1]) / 255, CGFloat(_data[0]) / 255, 1)
            
            UIGraphicsEndImageContext()
        } else {
            color = self
        }
        
        //Calculate Luminance
        if !flat {
            return (color.luminance > 0.6) ? RGBa(0, 0, 0, alpha) : RGBa(255, 255, 255, alpha)
        } else {
            return (color.luminance > 0.6) ? HSBa(0, 0, 15, alpha) : HSBa(192, 2, 95, alpha)
        }
    }
    
    /**
    *  Creates and returns a gradient as a color object with an alpha value of 1.0
    *
    *  @param gradientStyle Specifies the style and direction of the gradual blend between colors.
    *  @param frame The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
    *  @param colors An array of color objects used to create a gradient.
    *
    *  @return A @c UIColor object using colorWithPattern.
    *
    *  @since 2.0
    */
    class func colorWithGradientStyle(gradientStyle:UIGradientStyle, withFrame frame:CGRect, andColors colors:[UIColor]) -> UIColor {
        //Create our background gradient layer
        let backgroundGradientLayer = CAGradientLayer()
        
        //Set the frame to our object's bounds
        backgroundGradientLayer.frame = frame
        
        //To simplfy formatting, we'll iterate through our colors array and create a mutable array with their CG counterparts
        let cgColors = colors.map { $0.CGColor }
        
        switch gradientStyle {
        case .LeftToRight:
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors
            
            //Specify the direction our gradient will take
            backgroundGradientLayer.startPoint = CGPointMake(0.0, 0.5)
            backgroundGradientLayer.endPoint   = CGPointMake(1.0, 0.5)
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, false, UIScreen.mainScreen().scale)
            backgroundGradientLayer.renderInContext(UIGraphicsGetCurrentContext()!)
            let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return UIColor(patternImage: backgroundColorImage!)
        case .Radial:
            UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.mainScreen().scale)
            
            //Specific the spread of the gradient (For now this gradient only takes 2 locations)
            let locations:[CGFloat] = [0.0, 1.0]
            
            //Default to the RGB Colorspace
            let myColorspace = CGColorSpaceCreateDeviceRGB()!
            
            //Create our Fradient
            let myGradient = CGGradientCreateWithColors(myColorspace, cgColors, locations);
            
            
            // Normalise the 0-1 ranged inputs to the width of the image
            let myCentrePoint = CGPointMake(0.5 * frame.size.width, 0.5 * frame.size.height)
            let myRadius = min(frame.size.width, frame.size.height) * 1.0
            
            // Draw our Gradient
            CGContextDrawRadialGradient(UIGraphicsGetCurrentContext()!, myGradient, myCentrePoint, 0, myCentrePoint, myRadius, CGGradientDrawingOptions.DrawsAfterEndLocation)
            
            // Grab it as an Image
            let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
            
            // Clean up
            UIGraphicsEndImageContext()
            
            return UIColor(patternImage: backgroundColorImage)
        default:
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, false, UIScreen.mainScreen().scale)
            backgroundGradientLayer.renderInContext(UIGraphicsGetCurrentContext()!)
            let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return UIColor(patternImage:backgroundColorImage)
        }
    }
    
    /**
    *  Returns a randomly generated flat color object with an alpha value of 1.0 in either a light or dark shade.
    *
    *  @param shadeStyle Specifies whether the randomly generated flat color should be a light or dark shade.
    *  @param alpha      The opacity.
    *
    *  @return A flat @c UIColor object in the HSB colorspace.
    *
    *  @since 2.0
    */
    class func randomFlatColorOfShadeStyle(shadeStyle: UIShadeStyle, withAlpha alpha:CGFloat = 1.0) -> UIColor {
        //Number of colors to choose from
        let numberOfPossibleColors = 24
        
        //Chose one of those colors at random
        var randomColorChosen = generateRandomNumberWithMax(numberOfPossibleColors)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let key = "previousRandomNumber"
        //Check if a previous random number exists
        if let previousInt = defaults.objectForKey(key) as? Int {
            //Keep generating a random number until it is different than the one generated last time
            while randomColorChosen == previousInt {
                randomColorChosen = generateRandomNumberWithMax(numberOfPossibleColors)
            }
        }
        //Once a new number has been generated then store it as the previous number for next time and proceed
        defaults.setInteger(randomColorChosen, forKey:key)
        defaults.synchronize()
        
        //Assign a random color based on randomColorChosen
        let randomColor: UIColor
        
        //Return a color depending on the specified shade
        switch shadeStyle {
        case .Dark:
            randomColor = flatDarkColors()[randomColorChosen]
        case .Light:
            randomColor = flatLightColors()[randomColorChosen]
        }
        
        //Return color with correct alpha value
        return randomColor.colorWithAlphaComponent(alpha)
    }
    
    public func contrastingStatusBarStyle() -> UIStatusBarStyle {
        return (luminance > 0.6) ? .Default : .LightContent
    }
}
