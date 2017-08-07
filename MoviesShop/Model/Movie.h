#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, readonly) NSInteger movieId;
@property (nonatomic, readonly) NSString  *movieTitle;
@property (nonatomic, readonly) NSString  *movieOverview;
@property (nonatomic, readonly) NSDate    *releaseDate;
@property (nonatomic, readonly) NSString  *releaseDateString;
@property (nonatomic, readonly) NSString  *posterPath;
@property (nonatomic, readonly) BOOL      isAdult;
@property (nonatomic, readonly) float     rating;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
