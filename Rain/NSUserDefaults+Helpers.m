//
//  NSUserDefaults+Helpers.m
//  Rain
//
//  Created by Chris Lam on 6/05/14.
//  Copyright (c) 2014 Chris Lam. All rights reserved.
//

#import "NSUserDefaults+Helpers.h"

@implementation NSUserDefaults (Helpers)

+ (BOOL)isDefaultCelcius {
    return [[NSUserDefaults standardUserDefaults] integerForKey:CLRainUserDefaultsTemperatureUnit] == 1;
}

+ (void)setDefaultToCelcius {
    // Update User Defaults
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:1 forKey:CLRainUserDefaultsTemperatureUnit];
    [ud synchronize];
    
    // Post Notification
    [[NSNotificationCenter defaultCenter] postNotificationName:CLRainTemperatureUnitDidChangeNotification object:nil];
}

+ (void)setDefaultToFahrenheit {
    // Update User Defaults
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:0 forKey:CLRainUserDefaultsTemperatureUnit];
    [ud synchronize];
    
    // Post Notification
    [[NSNotificationCenter defaultCenter] postNotificationName:CLRainTemperatureUnitDidChangeNotification object:nil];
}

@end
