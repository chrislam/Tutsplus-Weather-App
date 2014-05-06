//
//  CLConstants.m
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import "CLConstants.h"
#pragma mark -
#pragma mark User Defaults
NSString * const CLRainUserDefaultsLocation = @"location";
NSString * const CLRainUserDefaultsLocations = @"locations";
NSString * const CLRainUserDefaultsTemperatureUnit = @"temperatureUnit";
#pragma mark -
#pragma mark Notifications
NSString * const CLRainDidAddLocationNotification = @"com.mobileTuts.CLRainDidAddLocationNotification";
NSString * const CLRainLocationDidChangeNotification = @"com.mobileTuts.CLRainLocationDidChangeNotification";
NSString * const CLRainWeatherDataDidChangeChangeNotification = @"com.chrisLam.CLRainWeatherDataDidChangeChangeNotification";
NSString * const CLRainTemperatureUnitDidChangeNotification = @"com.chrisLam.CLRainTemperatureUnitDidChangeNotification";
#pragma mark -
#pragma mark Location Keys
NSString * const CLLocationKeyCity = @"city";
NSString * const CLLocationKeyCountry = @"country";
NSString * const CLLocationKeyLatitude = @"latitude";
NSString * const CLLocationKeyLongitude = @"longitude";
#pragma mark -
#pragma mark Forecast API
NSString * const CLForecastAPIKey = @"1b358abacf974c59bb2aa321148efa1f";
NSString * const CLRainReachabilityStatusDidChangeNotification = @"com.chrisLam.CLRainReachabilityStatusDidChangeNotification";