//
//  NSNumber+Custom.m
//  

#import "NSNumber+Custom.h"

@implementation NSNumber (Custom)

+ (BOOL)isValidNumber:(id)obj {
    if (obj != nil && obj != [NSNull null] && [obj isKindOfClass:[NSNumber class]]) {
        return YES;
    } else {
        if (obj != nil && obj != [NSNull null] && [obj isKindOfClass:[NSString class]]) {
            if ([NSNumber isNumber:obj]) {
                return YES;
            }
        }
        return NO;
    }
}

+ (NSInteger)validInteger:(id)obj {
    if ([NSNumber isValidNumber:obj]) {
        return [obj integerValue];
    } else {
        return NSIntegerMax;
    }
}

+ (BOOL)validBool:(id)obj {
    if ([NSNumber isValidNumber:obj]) {
        return [obj boolValue];
    }
    return NO;
}

+ (float)validFloat:(id)obj {
    if ([NSNumber isValidNumber:obj]) {
        return [obj floatValue];
    } else {
        return INFINITY;
    }
}

+ (BOOL)isNumber:(id)text {
    NSCharacterSet *digitCharSet = [NSCharacterSet
                                    characterSetWithCharactersInString:@"0123456789"];
    
    NSScanner *aScanner = [NSScanner localizedScannerWithString:text];
    [aScanner setCharactersToBeSkipped:nil];
    
    [aScanner scanCharactersFromSet:digitCharSet intoString:NULL];
    return [aScanner isAtEnd];
}

@end
