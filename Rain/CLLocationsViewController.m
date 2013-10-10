//
//  CLLocationsViewController.m
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import "CLLocationsViewController.h"

@interface CLLocationsViewController ()
@property (strong, nonatomic) NSMutableArray *locations;

@end

@implementation CLLocationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Load locations
        [self loadLocations];
        // Add Observer
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddLocation:) name:CLRainDidAddLocationNotification object:nil];
    }
    return self;
}

static NSString *LocationCell = @"LocationCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView
{
    // Register Class for Cell Reuse
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:LocationCell];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.locations count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LocationCell forIndexPath:indexPath];
    // Configure Cell
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [cell.textLabel setText:@"Add Current Location"];
    } else {
        // Fetch Location
        NSDictionary *location = [self.locations objectAtIndex:(indexPath.row - 1)];
        // Configure Cell
        [cell.textLabel setText:[NSString stringWithFormat:@"%@, %@", location[CLLocationKeyCity], location[CLLocationKeyCountry]]];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:(indexPath) animated:YES];
    if (indexPath.row == 0) {
        // Notify Delegate
        [self.delegate controllerShouldAddCurrentLocation:self];
    } else {
        // Fetch Location
        NSDictionary *location = [self.locations objectAtIndex:(indexPath.row - 1)];
        // Notify Delegate
        [self.delegate controller:self didSelectLocation:location];
    }
    // Show Center View Controller
    [self.viewDeckController closeLeftViewAnimated:YES];
}

- (void)loadLocations
{
    self.locations = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:CLRainUserDefaultsLocations]];
}

- (void)didAddLocation:(NSNotification *)notification {
    NSDictionary *location = [notification userInfo];
    [self.locations addObject:location];
    [self.locations sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:CLLocationKeyCity ascending:YES]]];
    [self.tableView reloadData];
}

- (void)dealloc {
    // Remove Observer
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if (_delegate) {
        _delegate = nil;
    }
}

@end
