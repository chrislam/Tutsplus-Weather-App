//
//  CLDayCell.m
//  Rain
//
//  Created by Chris Lam on 6/05/14.
//  Copyright (c) 2014 Chris Lam. All rights reserved.
//

#import "CLDayCell.h"

#define kCLCalendarWidth 44.0
#define kCLCalendarHeight 80.0
#define kCLCalendarMarginLeft 60.0
#define kCLLabelRightWidth 30.0
#define kCLLabelRightHeight 14.0

@interface CLDayCell ()

@property (strong, nonatomic) UIImageView *imageViewCalendar;

@end

@implementation CLDayCell

#pragma mark -
#pragma mark Initialization
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Helpers
        CGSize size = self.contentView.frame.size;
        
        // Configure Table View Cell
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        // Initialize Image View Clock
        self.imageViewCalendar = [[UIImageView alloc] initWithFrame:CGRectMake(kCLCalendarMarginLeft, 0.0, kCLCalendarWidth, kCLCalendarHeight)];
        
        // Configure Image View Clock
        [self.imageViewCalendar setContentMode:UIViewContentModeCenter];
        [self.imageViewCalendar setImage:[UIImage imageNamed:@"background-calendar-day-cell"]];
        [self.imageViewCalendar setAutoresizingMask:(UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.imageViewCalendar];
        
        // Initialize Label Day
        self.labelDay = [[UILabel alloc] initWithFrame:CGRectMake(kCLCalendarMarginLeft, 10.0, kCLCalendarWidth, 20.0)];
        
        // Configure Label Day
        [self.labelDay setTextColor:[UIColor whiteColor]];
        [self.labelDay setTextAlignment:NSTextAlignmentCenter];
        [self.labelDay setBackgroundColor:[UIColor clearColor]];
        [self.labelDay setFont:[UIFont fontWithName:@"GillSans" size:14.0]];
        [self.labelDay setAutoresizingMask:(UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.labelDay];
        
        // Initialize Label Date
        self.labelDate = [[UILabel alloc] initWithFrame:CGRectMake(kCLCalendarMarginLeft, 20.0, kCLCalendarWidth, 60.0)];
        
        // Configure Label Date
        [self.labelDate setTextColor:kCLColorGray];
        [self.labelDate setTextAlignment:NSTextAlignmentCenter];
        [self.labelDate setBackgroundColor:[UIColor clearColor]];
        [self.labelDate setFont:[UIFont fontWithName:@"GillSans" size:24.0]];
        [self.labelDate setAutoresizingMask:(UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.labelDate];
        
        // Initialize Label Wind
        self.labelWind = [[UILabel alloc] initWithFrame:CGRectMake(size.width - kCLLabelRightWidth, (size.height / 2.0) - kCLLabelRightHeight, kCLLabelRightWidth, kCLLabelRightHeight)];
        
        // Configure Label Wind
        [self.labelWind setTextColor:kCLColorGray];
        [self.labelWind setTextAlignment:NSTextAlignmentCenter];
        [self.labelWind setBackgroundColor:[UIColor clearColor]];
        [self.labelWind setFont:[UIFont fontWithName:@"GillSans" size:12.0]];
        [self.labelWind setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin)];
        [self.contentView addSubview:self.labelWind];
        
        // Initialize Label Rain
        self.labelRain = [[UILabel alloc] initWithFrame:CGRectMake(size.width - kCLLabelRightWidth, (size.height / 2.0), kCLLabelRightWidth, kCLLabelRightHeight)];
        
        // Configure Label Rain
        [self.labelRain setTextColor:kCLColorGray];
        [self.labelRain setTextAlignment:NSTextAlignmentCenter];
        [self.labelRain setBackgroundColor:[UIColor clearColor]];
        [self.labelRain setFont:[UIFont fontWithName:@"GillSans" size:12.0]];
        [self.labelRain setAutoresizingMask:(UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin)];
        [self.contentView addSubview:self.labelRain];
        
        // Initialize Label Temp
        self.labelTemp = [[UILabel alloc] initWithFrame:CGRectMake(kCLCalendarWidth + kCLCalendarMarginLeft + 12.0, 0.0, size.width - kCLCalendarWidth - kCLCalendarMarginLeft - kCLLabelRightWidth - 12.0, size.height)];
        
        // Configure Label Temp
        [self.labelTemp setTextColor:kCLColorGray];
        [self.labelTemp setTextAlignment:NSTextAlignmentCenter];
        [self.labelTemp setBackgroundColor:[UIColor clearColor]];
        [self.labelTemp setFont:[UIFont fontWithName:@"GillSans-Bold" size:40.0]];
        [self.labelTemp setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
        [self.contentView addSubview:self.labelTemp];
    }
    
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
