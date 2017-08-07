//
//  HTTPRequestOperationManager.m
//  MoviesShop
//

#import "HttpSessionManager.h"

@interface HttpSessionManager ()

@end

@implementation HttpSessionManager

+ (HttpSessionManager *)sharedSession {
    static dispatch_once_t once;
    static HttpSessionManager *sharedSession = nil;
    dispatch_once(&once, ^{
        sharedSession = [[self alloc] init];
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
        AFHTTPRequestSerializer *request = [AFHTTPRequestSerializer serializer];
        sharedSession.requestSerializer = request;
        sharedSession.responseSerializer = serializer;
    });
    return sharedSession;
}

- (HttpSessionManager *)fetchListMoviesPage:(int)page completion:(NetworkCompletionAction)completion {
    NSString *url = [NSString stringWithFormat:@"http://api.themoviedb.org/3/movie/top_rated?api_key=%@&page=%d",
                     kAPIKey,page];
    [self GET:url
            parameters:nil
            progress:nil
            success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject){
                completion(self, kNetworkCompletionSuccess, (NSDictionary *)responseObject);
            }
            failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                completion(self, kNetworkCompletionFail, nil);
            }];
    return self;
}

@end
