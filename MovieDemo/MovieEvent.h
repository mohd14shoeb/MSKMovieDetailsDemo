//
//  MovieEvent.h
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EventDate;
@class EventVenue;

@interface MovieEvent : NSObject
{

}
@property(nonatomic, retain) NSArray  *eventDateArray;
@property(nonatomic, retain) NSArray  *eventVenueArray;
@property (strong, nonatomic) NSString *eventTitle;
@property (strong, nonatomic) NSString *actors;
@property (strong, nonatomic)NSString *bannerURL;
@property (strong, nonatomic) NSString *language;
@property (strong, nonatomic) NSString *genre;
@property (strong, nonatomic) NSString *eventSynopsis;
@property (strong, nonatomic) NSString *director;
@property (strong, nonatomic) NSString *length;



@end
