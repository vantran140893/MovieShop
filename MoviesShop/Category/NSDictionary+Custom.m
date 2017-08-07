//
//  NSDictionary+Custom.m
//  

#import "NSDictionary+Custom.h"

@implementation NSDictionary (Custom)

+ (BOOL)isValidDictionary:(id)obj {
    if (obj != nil && obj != [NSNull null] && [obj isKindOfClass:[NSDictionary class]]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSDictionary *)validDictionary:(id)obj {
    if ([NSDictionary isValidDictionary:obj]) {
        return obj;
    } else {
        return [NSDictionary dictionary];
    }
}

- (NSString *)validStringForKey:(id)key {
    @try {
        return [NSString validString:[self objectForKey:key]];
    }
    @catch (NSException *exception) {
        return @"";
    }
}

- (NSInteger)validIntegerForKey:(id)key {
    @try {
        return [NSNumber validInteger:[self objectForKey:key]];
    }
    @catch (NSException *exception) {
        return NSIntegerMax;
    }
}

- (NSArray *)validArrayForKey:(id)key {
    @try {
        return [NSArray validArray:[self objectForKey:key]];
    }
    @catch (NSException *exception) {
        return [NSArray array];
    }
}

- (NSDictionary *)validDictionaryForKey:(id)key {
    @try {
        return [NSDictionary validDictionary:[self objectForKey:key]];
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionary];
    }
}

- (NSDate *)validDateForKey:(id)key {
    @try {
        return [NSDate validDate:[self objectForKey:key]];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (float)validFloatForKey:(id)key {
    @try {
        return [NSNumber validFloat:[self objectForKey:key]];
    }
    @catch (NSException *exception) {
        return INFINITY;
    }
}

- (BOOL)validBoolForKey:(id)key {
    @try {
        return [NSNumber validBool:[self objectForKey:key]];
    }
    @catch (NSException *exception) {
        return NO;
    }
}

- (id)validObjectForKey:(id)key {
    @try {
        return [self objectForKey:key];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
