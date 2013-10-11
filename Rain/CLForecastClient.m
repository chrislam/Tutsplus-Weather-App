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
    }
    return self;
}

+ (NSURL *)baseURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/", CLForecastAPIKey]];
}

@end

