//
//  NSArray+Custom.m
//  

#import "NSArray+Custom.h"

@implementation NSArray (Custom)

+ (BOOL)isValidArray:(id)obj {
    if (obj != nil && obj != [NSNull null] && [obj isKindOfClass:[NSArray class]]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSArray *)validArray:(id)obj {
    if ([NSArray isValidArray:obj]) {
        return obj;
    } else {
        return [NSArray array];
    }
}

@end
