//
//  CLForecastClient.m
//  Rain
//
//  Created by Chris Lam on 11/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import "CLForecastClient.h"

@implementation CLForecastClient

+ (CLForecastClient *)sharedClient {
    static dispatch_once_t predicate;
    static CLForecastClient *_sharedClient = nil;
    dispatch_once(&predicate, ^{
        _sharedClient = [self alloc];
        _sharedClient = [_sharedClient initWithBaseURL:[self baseURL]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        // Accept HTTP Header
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        // Register HTTP Operation Class
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        // Reachability
        __weak typeof(self)weakSelf = self;
        [self setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            [[NSNotificationCenter defaultCenter] postNotificationName:CLRainReachabilityStatusDidChangeNotification object:weakSelf];
        }];
    }
    return self;
}

+ (NSURL *)baseURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/", CLForecastAPIKey]];
}

- (void)requestWeatherForCoordinate:(CLLocationCoordinate2D)coordinate completion:(CLForecastClientCompletionBlock)completion {
    NSString *path = [NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude];
    [self getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id response) {
        if (completion) {
            completion(YES, response);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(NO, nil);
            NSLog(@"Unable to fetch weather data due to error %@ with user info %@.", error, error.userInfo);
        }
    }];
}

@end

