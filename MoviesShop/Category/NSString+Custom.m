//
//  NSString+Custom.m
//  

#import "NSString+Custom.h"

@implementation NSString (Custom)

+ (BOOL)isValidString:(id)str {
    if (str != nil && str != [NSNull null] && [str isKindOfClass:[NSString class]]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *)validString:(id)str {
    if ([NSString isValidString:str]) {
        return str;
    } else {
        return @"";
    }
}

- (NSURL *)toURL {
    return [NSURL URLWithString:self];
}

- (NSURL *)toFileURL {
    return [NSURL fileURLWithPath:self];
}

- (UIImage *)toImage {
    return [UIImage imageNamed:self];
}

@end
