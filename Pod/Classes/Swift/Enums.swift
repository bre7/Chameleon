//
//  ChameleonEnums.h
//  Chameleon
//
//  Created by Vicc Alexander on 6/8/15.
//  Copyright (c) 2015 Vicc Alexander. All rights reserved.
//

import Foundation

public enum ColorScheme {
    /**
    *  Analogous color schemes use colors that are next to each other on the color wheel. They usually match well and create serene and comfortable designs. Analogous color schemes are often found in nature and are harmonious and pleasing to the eye. Make sure you have enough contrast when choosing an analogous color scheme. Choose one color to dominate, a second to support. The third color is used (along with black, white or gray) as an accent.
    *
    *  @since 1.0
    */
    case Analogous
    /**
    *  Colors that are opposite each other on the color wheel are considered to be complementary colors (example: red and green). The high contrast of complementary colors creates a vibrant look especially when used at full saturation. This color scheme must be managed well so it is not jarring. Complementary colors are tricky to use in large doses, but work well when you want something to stand out. Complementary colors are really bad for text.
    *
    *  @since 1.0
    */
    case Triadic
    /**
    *  A triadic color scheme uses colors that are evenly spaced around the color wheel. Triadic color harmonies tend to be quite vibrant, even if you use pale or unsaturated versions of your hues. To use a triadic harmony successfully, the colors should be carefully balanced - let one color dominate and use the two others for accent.
    *
    *  @since 1.0
    */
    case Complementary
}

/**
*  Specifies how text-based UI elements and other content such as switch knobs, should be colored.
*
*  - :since 2.0
*/
public enum UIContentStyle {
    /**
    *  Automatically chooses and colors text-based elements with the shade that best contrasts its @c backgroundColor.
    *
    *  @since 2.0
    */
    case Contrast
    /**
    *  Colors text-based elements using a light shade.
    *
    *  @since 2.0
    */
    case Light
    /**
    *  Colors text-based elements using a light shade.
    *
    *  @since 2.0
    */
    case Dark
}

/**
*  Defines the gradient style and direction of the gradient color.
*
*  @since 1.0
*/
public enum UIGradientStyle {
    /**
    *  Returns a gradual blend between colors originating at the leftmost point of an object's frame, and ending at the rightmost point of the object's frame.
    *
    *  @since 1.0
    */
    case LeftToRight
    /**
    *  Returns a gradual blend between colors originating at the center of an object's frame, and ending at all edges of the object's frame. NOTE: Supports a Maximum of 2 Colors.
    *
    *  @since 1.0
    */
    case Radial
    /**
    *  Returns a gradual blend between colors originating at the topmost point of an object's frame, and ending at the bottommost point of the object's frame.
    *
    *  @since 1.0
    */
    case TopToBottom
}

/**
*  Defines the shade of a any flat color.
*
*  @since 1.0
*/
public enum UIShadeStyle {
    /**
    *  Returns the light shade version of a flat color.
    *
    *  @since 1.0
    */
    case Light
    /**
    *  Returns the dark shade version of a flat color.
    *
    *  @since 1.0
    */
    case Dark
}
