//
//  EventCell.h
//  7PM
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell{
    UILabel *titleLabel;
    UILabel *timeLabel;
    UILabel *priceRangeLabel;
    UILabel *numOfTicketsLabel;

}
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UILabel *priceRangeLabel;
@property (nonatomic, retain) IBOutlet UILabel *numOfTicketsLabel;

@end
