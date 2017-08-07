//
//  NSDate+Custom.m
//  

#import "NSDate+Custom.h"

@implementation NSDate (Custom)

+ (BOOL)isValidDate:(id)obj {
    if (obj != nil && obj != [NSNull null] && [obj isKindOfClass:[NSDate class]]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSDate *)validDate:(id)obj {
    if ([NSDate isValidDate:obj]) {
        return obj;
    } else {
        return nil;
    }
}

@end
