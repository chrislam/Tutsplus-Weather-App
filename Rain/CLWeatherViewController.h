//
//  CLWeatherViewController.h
//  Rain
//
//  Created by Chris Lam on 10/10/13.
//  Copyright (c) 2013 Chris Lam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLLocationsViewController.h"

@interface CLWeatherViewController : UIViewController <CLLocationsViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelLocation;
@property (weak, nonatomic) IBOutlet UIButton *buttonRefresh;
@end
