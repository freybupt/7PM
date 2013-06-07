//
//  ViewController.m
//  Sherpa
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import "ViewController.h"
#import "TicketDetailViewController.h"
#import "TicketListViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize tickets, tableView, nibLoadedCell, titleLabel;

#pragma mark - tableview methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tickets count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CustomizedTicketCell";
    
    EventCell *cell = (EventCell *)[_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"EventCell" owner:self options:NULL];
        cell = (EventCell*)nibLoadedCell;
    }
    Tickets *thisTicket = [tickets objectAtIndex:indexPath.row];
    cell.titleLabel.text = thisTicket.name;
    cell.timeLabel.text = thisTicket.date;
    cell.priceRangeLabel.text = [NSString stringWithFormat:@"$%@-$%@", thisTicket.minPrice, thisTicket.price];

    thisTicket.numberOfTickets =[NSString stringWithFormat: @"%@", thisTicket.numberOfTickets];
        
    return cell;
}

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    TicketDetailViewController *viewController = [[TicketDetailViewController alloc] initWithNibName:@"TicketDetailViewController" bundle:nil];
//    Tickets *thisTicket = [tickets objectAtIndex:indexPath.row];
//    viewController.name = thisTicket.name;
//    viewController.date = thisTicket.date;
//    viewController.startTime = thisTicket.startTime;
//    viewController.endTime = thisTicket.endTime;
//    viewController.description = thisTicket.description;
//    viewController.price = thisTicket.price;
//    viewController.location = thisTicket.location;
    TicketListViewController *viewController = [[TicketListViewController alloc] initWithNibName:@"TicketListViewController" bundle:nil];
    Tickets *selectedTicket = [tickets objectAtIndex:indexPath.row];
    viewController.eventId = selectedTicket.eventId;
    viewController.eventName = selectedTicket.name;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentModalViewController:navController animated:YES];
    
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - view methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = @"Loading...";
    //sample data
    tickets = [[NSMutableArray alloc] init];
//    Tickets *oneTicket = [[Tickets alloc] init];
//    oneTicket.name = @"WWE Summerslam Tickets";
//    oneTicket.description = @"";
//    oneTicket.date = @"Aug 19, 2012";
//    oneTicket.startTime = @"4:45 pm";
//    oneTicket.endTime = @"";
//    oneTicket.price = @"$98";
//    oneTicket.location = @"STAPLES Center in Los Angeles";
//    oneTicket.imageName = @"";
//    [tickets addObject:oneTicket];
//    
//    oneTicket.name = @"Cirque du Soleil Iris Hollywood Tickets";
//    oneTicket.description = @"";
//    oneTicket.date = @"Aug 19, 2012";
//    oneTicket.startTime = @"";
//    oneTicket.endTime = @"";
//    oneTicket.price = @"300";
//    [tickets addObject:oneTicket];
//    
//    oneTicket.name = @"Gavin Degraw and Colbie Caillat Tickets";
//    oneTicket.description = @"";
//    oneTicket.date = @"Aug 19, 2012";
//    oneTicket.startTime = @"";
//    oneTicket.endTime = @"";
//    oneTicket.price = @"150";
//    [tickets addObject:oneTicket];
    
    //get real data
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://216.86.123.70/events.json"] cachePolicy:NSURLCacheStorageAllowed timeoutInterval:4];
//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [NSURLConnection sendAsynchronousRequest:request queue:[[[NSOperationQueue alloc] init] autorelease] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if (data) {
            NSArray *result = [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] JSONValue];
            for (NSDictionary *resultDict in result) {
                Tickets *event = [[Tickets alloc] init];
                event.name = [NSString stringWithFormat:@"%@", [resultDict objectForKey:@"name"]];
                event.description = [resultDict objectForKey:@"created_at"];
                event.numberOfTickets = [resultDict objectForKey:@"total_tickets"];
                [tickets addObject:event];
                [tickets retain];
            }
            self.titleLabel.text = @"7PM";
            [self.tableView reloadData];
        }
    }];

    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(IBAction)dismissVIew:(id)sender{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
