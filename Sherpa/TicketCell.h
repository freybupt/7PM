//
//  TicketCell.h
//  Sherpa
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketCell : UITableViewCell{
    UILabel *title;
    UILabel *time;
    UILabel *price;
    UILabel *minPrice;
    UILabel *buyPrice;
    UIButton *buyButton;
    
    UIView *buyView;
    BOOL isBuyViewShown;
}
@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UILabel *time;
@property (nonatomic, retain) IBOutlet UILabel *price;
@property (nonatomic, retain) IBOutlet UILabel *minPrice;
@property (nonatomic, retain) IBOutlet UIView *buyView;
@property (nonatomic, retain) IBOutlet UILabel *buyPrice;
@property (nonatomic, retain) IBOutlet UIButton *buyButton;
@property (nonatomic, assign) BOOL isBuyViewShown;

@end
