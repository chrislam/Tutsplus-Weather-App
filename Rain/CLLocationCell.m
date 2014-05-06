//
//  CLLocationCell.m
//  Rain
//
//  Created by Chris Lam on 7/05/14.
//  Copyright (c) 2014 Chris Lam. All rights reserved.
//

#import "CLLocationCell.h"

#define kCLButtonDeleteWidth 44.0
#define kCLLabelLocationMarginLeft 44.0

@implementation CLLocationCell

#pragma mark -
#pragma mark Initialization
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Helpers
        CGSize size = self.contentView.frame.size;
        
        // Initialize Delete Button
        self.buttonDelete = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // Configure Delete Button
        [self.buttonDelete setFrame:CGRectMake(0.0, 0.0, kCLButtonDeleteWidth, size.height)];
        [self.buttonDelete setImage:[UIImage imageNamed:@"button-delete-location-cell"] forState:UIControlStateNormal];
        [self.buttonDelete setImage:[UIImage imageNamed:@"button-delete-location-cell"] forState:UIControlStateSelected];
        [self.buttonDelete setImage:[UIImage imageNamed:@"button-delete-location-cell"] forState:UIControlStateDisabled];
        [self.buttonDelete setImage:[UIImage imageNamed:@"button-delete-location-cell"] forState:UIControlStateHighlighted];
        [self.buttonDelete setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin)];
        [self.contentView addSubview:self.buttonDelete];
        
        // Initialize Location Label
        self.labelLocation = [[UILabel alloc] initWithFrame:CGRectMake(kCLLabelLocationMarginLeft, 0.0, size.width - kCLLabelLocationMarginLeft, size.height)];
        
        // Configure Text Label
        [self.labelLocation setTextColor:kCLColorGray];
        [self.labelLocation setBackgroundColor:[UIColor clearColor]];
        [self.labelLocation setFont:[UIFont fontWithName:@"GillSans" size:20.0]];
        [self.labelLocation setAutoresizingMask:(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin)];
        [self.contentView addSubview:self.buttonDelete];
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
