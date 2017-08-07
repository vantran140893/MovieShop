//
//  HttpSessionManager.h
//  MoviesShop
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum {
    kNetworkCompletionUnknown = 0,
    kNetworkCompletionSuccess,
    kNetworkCompletionFail,
    kNetworkCompletionTimeout,
} NetworkCompletionType;

typedef void(^NetworkCompletionAction)(id sender, NetworkCompletionType type, NSDictionary *result);

@interface HttpSessionManager : AFHTTPSessionManager

+ (HttpSessionManager *)sharedSession;

- (HttpSessionManager *)fetchListMoviesPage:(int)page completion:(NetworkCompletionAction)completion;

@end
