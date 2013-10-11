//
//  CLForecastClient.h
//  Rain
//
//  Created by Chris Lam on 11/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CLForecastClient : AFHTTPClient
#pragma mark -
#pragma mark Shared Client
+ (CLForecastClient *)sharedClient;
@end
