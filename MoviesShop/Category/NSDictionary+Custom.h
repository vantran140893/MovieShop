//
//  NSDictionary+Custom.h
//  

#import <Foundation/Foundation.h>

@interface NSDictionary (Custom)

+ (BOOL)isValidDictionary:(id)obj;

+ (NSDictionary *)validDictionary:(id)obj;

- (NSString *)validStringForKey:(id)key;

- (NSInteger)validIntegerForKey:(id)key;

- (NSArray *)validArrayForKey:(id)key;

- (NSDictionary *)validDictionaryForKey:(id)key;

- (NSDate *)validDateForKey:(id)key;

- (float)validFloatForKey:(id)key;

- (BOOL)validBoolForKey:(id)key;

- (id)validObjectForKey:(id)key;

@end
