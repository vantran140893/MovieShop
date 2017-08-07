//
//  MovieEntity.h
//  MoviesShop
//

#import <CoreData/CoreData.h>

@interface MovieEntity : NSManagedObject

@property (nonatomic, retain) NSString * movieId;
@property (nonatomic, retain) NSString * movieOverview;

@end
