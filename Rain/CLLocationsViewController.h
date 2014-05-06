//
//  CLLocationsViewController.h
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CLLocationsViewControllerDelegate;
@interface CLLocationsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) id<CLLocationsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@protocol CLLocationsViewControllerDelegate <NSObject>
- (void)controllerShouldAddCurrentLocation:(CLLocationsViewController *)controller;
- (void)controller:(CLLocationsViewController *)controller didSelectLocation:(NSDictionary *)location;
@end
