//
//  TicketListViewController.m
//  7PM
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import "TicketListViewController.h"
#import "TicketDetailViewController.h"

@interface TicketListViewController ()

@end

@implementation TicketListViewController

@synthesize eventId, eventName;


#pragma mark - tableView methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tickets count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CustomizedTicketCell";
    
    TicketCell *cell = (TicketCell *)[_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"TicketCell" owner:self options:NULL];
        cell = (TicketCell*)nibLoadedCell;
    }
    Tickets *thisTicket = [tickets objectAtIndex:indexPath.row];
    cell.title.text = thisTicket.description;
    cell.price.text = [NSString stringWithFormat:@"%@", thisTicket.location];
    cell.minPrice.text = [NSString stringWithFormat:@"%@-%@", thisTicket.minPrice, thisTicket.price];
    cell.buyPrice.text = [NSString stringWithFormat:@"%@", thisTicket.minPrice];
    cell.buyButton.tag = indexPath.row;
    cell.tag = indexPath.row;
    
    return cell;
}

- (void)tableView:(UITableView *)_tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    TicketCell *cell = (TicketCell *)[_tableView cellForRowAtIndexPath:indexPath];
    if (!cell.isBuyViewShown) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [cell.buyView setFrame:CGRectMake(cell.buyView.frame.origin.x - cell.buyView.frame.size.width, cell.buyView.frame.origin.y, cell.buyView.frame.size.width, cell.buyView.frame.size.height)];
        [UIView commitAnimations];
        cell.isBuyViewShown = YES;
    }
    else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [cell.buyView setFrame:CGRectMake(cell.buyView.frame.origin.x + cell.buyView.frame.size.width, cell.buyView.frame.origin.y, cell.buyView.frame.size.width, cell.buyView.frame.size.height)];
        [UIView commitAnimations];
        cell.isBuyViewShown = NO;
    }
    
    //move the buy view
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark - IBActions

- (IBAction)loadBuyDetails:(UIButton *)senderButton{
    TicketDetailViewController *viewController = [[TicketDetailViewController alloc] initWithNibName:@"TicketDetailViewController" bundle:nil];
    Tickets *thisTicket = [tickets objectAtIndex:senderButton.tag];
    viewController.name = thisTicket.name;
    viewController.date = thisTicket.date;
    viewController.startTime = thisTicket.startTime;
    viewController.endTime = thisTicket.endTime;
    viewController.description = thisTicket.description;
    viewController.price = thisTicket.price;
    viewController.location = thisTicket.location;

    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

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
    //sample data
    titleLabel.text = eventName;
    tickets = [[NSMutableArray alloc] init];
    
    //get real data
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://216.86.123.70/tickets.json?eventId=%@", self.eventId]] cachePolicy:NSURLCacheStorageAllowed timeoutInterval:4];
    //    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [NSURLConnection sendAsynchronousRequest:request queue:[[[NSOperationQueue alloc] init] autorelease] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if (data) {
            NSArray *result = [[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] JSONValue];
            for (NSDictionary *resultDict in result) {
                Tickets *ticket = [[Tickets alloc] init];
                ticket.name = [NSString stringWithFormat:@"%@", [resultDict objectForKey:@"submitter_email"]];
                ticket.description = [resultDict objectForKey:@"description"];
                ticket.price = [NSString stringWithFormat:@"$%@", [resultDict objectForKey:@"price"]];
                ticket.minPrice = [NSString stringWithFormat:@"$%@",[resultDict objectForKey:@"min_price"]];
                ticket.startTime = [resultDict objectForKey:@"event_time"];
                ticket.location =  [resultDict objectForKey:@"seat_location"]; 
                [tickets addObject:ticket];
                [tickets retain];
            }
            [self.tableView reloadData];
        }
    }];

}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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
