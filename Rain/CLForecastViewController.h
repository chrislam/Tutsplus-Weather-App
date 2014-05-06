//
//  CLForecastViewController.h
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLForecastViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;

@end
