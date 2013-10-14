//
//  CLForecastClient.h
//  Rain
//
//  Created by Chris Lam on 11/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import "AFHTTPClient.h"
typedef void (^CLForecastClientCompletionBlock)(BOOL success, NSDictionary *response);
@interface CLForecastClient : AFHTTPClient
#pragma mark -
#pragma mark Shared Client
+ (CLForecastClient *)sharedClient;
#pragma mark -
#pragma mark Instance Methods
- (void)requestWeatherForCoordinate:(CLLocationCoordinate2D)coordinate completion:(CLForecastClientCompletionBlock)completion;
@end
