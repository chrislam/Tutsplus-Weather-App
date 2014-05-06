//
//  CLForecastViewController.m
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import "CLForecastViewController.h"
#import "CLDayCell.h"

@interface CLForecastViewController ()

@property (strong, nonatomic) NSDictionary *response;
@property (strong, nonatomic) NSArray *forecast;

@end

static NSString *DayCell = @"DayCell";

@implementation CLForecastViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Add Observer
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(weatherDataDidChangeChange:) name:CLRainWeatherDataDidChangeChangeNotification object:nil];
        [nc addObserver:self selector:@selector(temperatureUnitDidChange:) name:CLRainTemperatureUnitDidChangeNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Configure Table View
    [self.tableView registerClass:[CLDayCell class] forCellReuseIdentifier:DayCell];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)weatherDataDidChangeChange:(NSNotification *)notification {
    // Update Response & Forecast
    [self setResponse:[notification userInfo]];
    [self setForecast:self.response[@"daily"][@"data"]];
    
    // Update View
    [self updateView];
}

- (void)temperatureUnitDidChange:(NSNotification *)notification {
    // Update View
    [self updateView];
}

- (void)updateView {
    // Reload Table Data
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.forecast ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.forecast count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CLDayCell *cell = [tableView dequeueReusableCellWithIdentifier:DayCell forIndexPath:indexPath];
    
    // Fetch Data
    NSDictionary *data = [self.forecast objectAtIndex:indexPath.row];
    
    // Initialize Date Formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[data[@"time"] doubleValue]];
    
    // Configure Cell
    [dateFormatter setDateFormat:@"EEE"];
    [cell.labelDay setText:[dateFormatter stringFromDate:date]];
    
    [dateFormatter setDateFormat:@"d"];
    [cell.labelDate setText:[dateFormatter stringFromDate:date]];
    
    float tempMin = [data[@"temperatureMin"] floatValue];
    float tempMax = [data[@"temperatureMax"] floatValue];
    [cell.labelTemp setText:[NSString stringWithFormat:@"%.0f°/%.0f°", tempMin, tempMax]];
    
    [cell.labelWind setText:[NSString stringWithFormat:@"%.0f", [data[@"windSpeed"] floatValue]]];
    
    float rainProbability = 0.0;
    if (data[@"precipProbability"]) {
        rainProbability = [data[@"precipProbability"] floatValue] * 100.0;
    }
    
    [cell.labelRain setText:[NSString stringWithFormat:@"%.0f", rainProbability]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

@end
