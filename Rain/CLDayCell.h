//
//  CLDayCell.h
//  Rain
//
//  Created by Chris Lam on 6/05/14.
//  Copyright (c) 2014 Chris Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLDayCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *labelDay;
@property (strong, nonatomic) IBOutlet UILabel *labelDate;
@property (strong, nonatomic) IBOutlet UILabel *labelTemp;
@property (strong, nonatomic) IBOutlet UILabel *labelWind;
@property (strong, nonatomic) IBOutlet UILabel *labelRain;

@end
