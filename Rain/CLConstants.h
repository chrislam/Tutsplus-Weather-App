//
//  CLConstants.h
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#pragma mark -
#pragma mark User Defaults
extern NSString * const CLRainUserDefaultsLocation;
extern NSString * const CLRainUserDefaultsLocations;
extern NSString * const CLRainUserDefaultsTemperatureUnit;
#pragma mark -
#pragma mark Notifications
extern NSString * const CLRainDidAddLocationNotification;
extern NSString * const CLRainLocationDidChangeNotification;
extern NSString * const CLRainWeatherDataDidChangeChangeNotification;
extern NSString * const CLRainTemperatureUnitDidChangeNotification;
#pragma mark -
#pragma mark Location Keys
extern NSString * const CLLocationKeyCity;
extern NSString * const CLLocationKeyCountry;
extern NSString * const CLLocationKeyLatitude;
extern NSString * const CLLocationKeyLongitude;
#pragma mark -
#pragma mark Forecast API
extern NSString * const CLForecastAPIKey;
extern NSString * const CLRainReachabilityStatusDidChangeNotification;
#pragma mark -
#pragma mark Colours
#define kCLColorGray [UIColor colorWithRed:0.737 green:0.737 blue:0.737 alpha:1.0]
#define kCLColorGreen [UIColor colorWithRed:0.325 green:0.573 blue:0.388 alpha:1.0]
#define kCLColorOrange [UIColor colorWithRed:1.000 green:0.306 blue:0.373 alpha:1.0]