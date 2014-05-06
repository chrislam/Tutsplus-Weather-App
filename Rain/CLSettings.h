//
//  CLSettings.h
//  Rain
//
//  Created by Chris Lam on 6/05/14.
//  Copyright (c) 2014 Chris Lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLSettings : NSObject

#pragma mark -
#pragma mark Convenience Methods
+ (NSString *)formatTemperature:(NSNumber *)temperature;
@end
