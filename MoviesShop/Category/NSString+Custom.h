//
//  NSString+Custom.h
//  

#import <Foundation/Foundation.h>

@interface NSString (Custom)

+ (NSString *)validString:(id)str;

- (NSURL *)toURL;

- (NSURL *)toFileURL;

- (UIImage *)toImage;

@end
