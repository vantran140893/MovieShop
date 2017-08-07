//
//  NSNumber+Custom.h
//  

#import <Foundation/Foundation.h>

@interface NSNumber (Custom)

+ (BOOL)isValidNumber:(id)obj;

+ (NSInteger)validInteger:(id)obj;

+ (float)validFloat:(id)obj;

+ (BOOL)validBool:(id)obj;

@end
