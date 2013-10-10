//
//  CLWeatherViewController.m
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import "CLWeatherViewController.h"

@interface CLWeatherViewController () <CLLocationManagerDelegate> {
    BOOL _locationFound;
}
@property (strong, nonatomic) NSDictionary *location;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation CLWeatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialize Location Manager
        self.locationManager = [[CLLocationManager alloc] init];
        // Configure Location Manager
        [self.locationManager setDelegate:self];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Load Location
    self.location = [[NSUserDefaults standardUserDefaults] objectForKey:CLRainUserDefaultsLocation];
    if (!self.location) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)controllerShouldAddCurrentLocation:(CLLocationsViewController *)controller {
    // Start Updating Location
    [self.locationManager startUpdatingLocation];
}
- (void)controller:(CLLocationsViewController *)controller didSelectLocation:(NSDictionary *)location {
    // Update Location
    self.location = location;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (![locations count] || _locationFound) return;
    // Stop Updating Location
    _locationFound = YES;
    [manager stopUpdatingLocation];
    // Current Location
    CLLocation *currentLocation = [locations objectAtIndex:0];
    // Reverse Geocode
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count]) {
            _locationFound = NO;
            [self processPlacemark:[placemarks objectAtIndex:0]];
        }
    }];
}

- (void)processPlacemark:(CLPlacemark *)placemark {
    // Extract Data
    NSString *city = [placemark locality];
    NSString *country = [placemark country];
    CLLocationDegrees lat = placemark.location.coordinate.latitude;
    CLLocationDegrees lon = placemark.location.coordinate.longitude;
    // Create Location Dictionary
    NSDictionary *currentLocation = @{ CLLocationKeyCity : city,
                                       CLLocationKeyCountry : country,
                                       CLLocationKeyLatitude : @(lat),
                                       CLLocationKeyLongitude : @(lon) };
    // Add to Locations
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSMutableArray *locations = [NSMutableArray arrayWithArray:[ud objectForKey:CLRainUserDefaultsLocations]];
    [locations addObject:currentLocation];
    [locations sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:CLLocationKeyCity ascending:YES]]];
    [ud setObject:locations forKey:CLRainUserDefaultsLocations];
    // Synchronize
    [ud synchronize];
    // Update Current Location
    self.location = currentLocation;
    // Post Notifications
    NSNotification *notification2 = [NSNotification notificationWithName:CLRainDidAddLocationNotification object:self userInfo:currentLocation];
    [[NSNotificationCenter defaultCenter] postNotification:notification2];
}

- (void)setLocation:(NSDictionary *)location {
    if (_location != location) {
        _location = location;
        // Update User Defaults
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:location forKey:CLRainUserDefaultsLocation];
        [ud synchronize];
        // Post Notification
        NSNotification *notification1 = [NSNotification notificationWithName:CLRainLocationDidChangeNotification object:self userInfo:location];
        [[NSNotificationCenter defaultCenter] postNotification:notification1];
        // Update View
        [self updateView];
    }
}

- (void)updateView {
    // Update Location Label
    [self.labelLocation setText:[self.location objectForKey:CLLocationKeyCity]];
}

@end
