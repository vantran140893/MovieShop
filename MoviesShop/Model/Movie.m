#import "Movie.h"

@interface Movie ()

@property (nonatomic, readwrite) NSInteger movieId;
@property (nonatomic, readwrite) NSString  *movieTitle;
@property (nonatomic, readwrite) NSString  *movieOverview;
@property (nonatomic, readwrite) NSDate    *releaseDate;
@property (nonatomic, readwrite) NSString  *releaseDateString;
@property (nonatomic, readwrite) NSString  *posterPath;
@property (nonatomic, readwrite) BOOL      isAdult;
@property (nonatomic, readwrite) float     rating;

@end

@implementation Movie

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _movieId           = [dict validIntegerForKey:@"id"];
        _movieTitle        = [dict validStringForKey :@"title"];
        _movieOverview     = [dict validStringForKey :@"overview"];
        _releaseDateString = [dict validStringForKey :@"release_date"];
        _isAdult           = [dict validBoolForKey   :@"adult"];
        _rating            = [dict validFloatForKey  :@"vote_count"];
        NSString * posterPath = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w154%@", [dict validStringForKey:@"poster_path"]];
        _posterPath        = posterPath;
    }
    return self;
}

@end
