//
//  NSUserDefaults+Helpers.h
//  Rain
//
//  Created by Chris Lam on 6/05/14.
//  Copyright (c) 2014 Chris Lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Helpers)

#pragma mark -
#pragma mark Temperature
+ (BOOL)isDefaultCelcius;
+ (void)setDefaultToCelcius;
+ (void)setDefaultToFahrenheit;

@end
