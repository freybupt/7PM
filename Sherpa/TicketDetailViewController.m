//
//  TicketDetailViewController.m
//  Sherpa
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import "TicketDetailViewController.h"

@interface TicketDetailViewController ()

@end

@implementation TicketDetailViewController

@synthesize timeLabel, priceLabel, descriptionsLabel, dateLabel, locationLable, imageView;
@synthesize name, description, startTime, endTime, price, date;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.titleLabel.text = self.name;
    self.dateLabel.text = self.date;
    self.timeLabel.text = self.startTime;
    self.descriptionsLabel.text = self.description;
    self.priceLabel.text = self.price;
    self.locationLable.text = self.location;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
