//
//  TicketDetailViewController.h
//  Sherpa
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TicketDetailViewController : ViewController{
    UITextView *descriptionsLabel;
    UILabel *dateLabel;
    UILabel *timeLabel;
    UILabel *priceLabel;
    UILabel *locationLable;
    UIImageView *imageView;
    
    NSString *name;
    NSString *description;
    NSString *startTime;
    NSString *endTime;
    NSString *date;
    NSString *price;
    NSString *location;
    
}


@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *imageName;


@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionsLabel;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *priceLabel;
@property (nonatomic, retain) IBOutlet UILabel *locationLable;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end
