#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageBackgroundTabBar {
    return [[UIImage imageWithColor:kDefaultColor alpha:1.0f size:CGSizeMake(64, 49)] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
}

+ (UIImage *)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *imageColor = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageColor;
}

@end
