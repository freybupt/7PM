//
//  TicketListViewController.h
//  7PM
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TicketListViewController : ViewController{
    NSString *eventId;
    NSString *eventName;
}

@property (nonatomic, retain) NSString *eventId;
@property (nonatomic, retain) NSString *eventName;

- (IBAction)loadBuyDetails:(UIButton *)senderButton;

@end
