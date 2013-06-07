//
//  Tickets.h
//  Sherpa
//
//  Created by Liang Shi on 2012-08-18.
//  Copyright (c) 2012 StartupWeekendVan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tickets : NSObject{
    NSString *name;
    NSString *description;
    NSString *startTime;
    NSString *endTime;
    NSString *date;
    NSString *minPrice;
    NSString *price;
    NSString *location;
    NSString *imageName;
    NSString *eventId;
    
    
    NSString *numberOfTickets;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *minPrice;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, retain) NSString *eventId;

@property (nonatomic, retain) NSString *numberOfTickets;

@end
