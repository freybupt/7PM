//
//  ViewController.h
//  Sherpa
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventCell.h"
#import "TicketCell.h"
#import "Tickets.h"
#import "JSON.h"
#import "SBJsonParser.h"


@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *tickets;
    UITableViewCell *nibLoadedCell;
    UITableView *tableView;
    
    UILabel *titleLabel;
}

@property (nonatomic, retain) NSMutableArray *tickets;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITableViewCell *nibLoadedCell;


-(IBAction)dismissVIew:(id)sender;

@end
