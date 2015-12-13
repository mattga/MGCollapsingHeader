//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Matthew Gardner
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


#import <UIKit/UIKit.h>

@protocol MGCollapsibleHeaderDelegate <NSObject>

- (void)headerDidCollapse;
- (void)headerDidFinishCollapsing;
- (void)headerDidExpand;
- (void)headerDidFinishExpanding;

@end

// TODO: Transform Functions
typedef enum : NSUInteger {
    MGTransformCurveLinear = 0,
    MGTransformCurveEaseIn,
    MGTransformCurveEaseOut,
    MGTransformCurveEaseInOut,
} MGTransformCurve;

/*!
 * @typedef MGAttribute
 * @brief Enumeration of attributes that can be transformed when scrolling.
 * @constant MGAttributeX x-value of a view's origin.
 * @constant MGAttributeY y-value of a view's origin.
 * @constant MGAttributeWidth Width of a view.
 * @constant MGAttributeHeight Height of a view.
 * @constant MGAttributeAlpha Apha value of a view.
 * @constant MGAttributeCornerRadius Corner radius of a view.
 * @constant MGAttributeShadowRadius Shadow radius of a view.
 * @constant MGAttributeCornerRadius Shadow opacity of a view.
 */
typedef enum : NSUInteger {
    MGAttributeX = 1,
    MGAttributeY,
    MGAttributeWidth,
    MGAttributeHeight,
    MGAttributeAlpha,
    MGAttributeCornerRadius,
    MGAttributeShadowRadius,
    MGAttributeShadowOpacity
} MGAttribute;

/*!
 * @brief Defines an attribute to be transformed when scrolling.
 */
@interface MGTransformAttribute : NSObject

@property (nonatomic) MGAttribute attribute;
@property (nonatomic) MGTransformCurve curve;
@property (nonatomic) CGFloat value, origValue, dValue;

+ (instancetype)attribute:(MGAttribute)attr value:(CGFloat)val;

@end

/*!
 * @brief Subclass of UIView that manages collapsing and expanding.
 */
@interface MGCollapsibleHeaderView : UIView {
    NSMutableArray *transfViews, *fadeViews;
    NSMutableDictionary *constrs, *constrVals, *transfAttrs, *alphaRatios;
    CGFloat lastOffset;
    CGFloat header_ht, scroll_ht, offset_max;
    NSLayoutConstraint *headerTop;
}

@property (nonatomic) CGFloat minimumHeaderHeight;

@property (strong, nonatomic) NSLayoutConstraint *scrollViewTop;

/*!
 * @discussion Adds a subview of the header that transforms as the user scrolls.
 * @param view The view to transform.
 * @param attrs A dictionary of attributes that describe the view in it's condensed form.
 Keys must be a MGAttribute; Values must be a double.
 * @return Boolean identifying if the transform was successfully added.
 */
- (BOOL)addTransformingSubview:(UIView *)view attributes:(NSArray *)attrs;

/*!
 * @discussion Adds a subview of the header that fades as the user scrolls.
 * @param view The view to fade away.
 * @param ratio The ratio of collapsing at which the subview will finish fading away.
 * @return Boolean identifying if the fading subview was successfully added.
 */
- (BOOL)addFadingSubview:(UIView *)view fadeBy:(CGFloat)ratio;

/*!
 * @discussion Tells the header to collapse with some offset. This should be called from
 a scrollViewDidScroll call.
 * @param offset The content offset of the scroll view.
 */
- (void)collapseToOffset:(CGPoint)offset;

@end
