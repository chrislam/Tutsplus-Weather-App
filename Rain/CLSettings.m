//
//  CLSettings.m
//  Rain
//
//  Created by Chris Lam on 6/05/14.
//  Copyright (c) 2014 Chris Lam. All rights reserved.
//

#import "CLSettings.h"
#import "NSUserDefaults+Helpers.h"

@implementation CLSettings

+ (NSString *)formatTemperature:(NSNumber *)temperature {
    float value = [temperature floatValue];
    
    if ([NSUserDefaults isDefaultCelcius]) {
        value = (value - 32.0) * (5.0 / 9.0);
    }
    
    return [NSString stringWithFormat:@"%.0f°", value];
}

@end
