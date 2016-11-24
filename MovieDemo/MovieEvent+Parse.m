//
//  MovieEvent+Parse.m
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "MovieEvent+Parse.h"
#import "EventDate+Parse.h"
#import "EventVenue+Parse.h"
#import "MovieEvent.h"

@implementation MovieEvent (Parse)

+(MovieEvent*) movieEventFromDictionary:(NSDictionary*)movieEventDics{
    MovieEvent *movieevent=[[MovieEvent alloc]init];
    movieevent.actors=[movieEventDics objectForKey:@"Actors"];
    movieevent.bannerURL=[movieEventDics objectForKey:@"BannerURL"];
    movieevent.eventTitle=[movieEventDics objectForKey:@"EventTitle"];
    movieevent.language=[movieEventDics objectForKey:@"Language"];
    movieevent.genre=[movieEventDics objectForKey:@"Genre"];
    movieevent.eventSynopsis=[movieEventDics objectForKey:@"EventSynopsis"];
     movieevent.director=[movieEventDics objectForKey:@"Director"];
     movieevent.length=[movieEventDics objectForKey:@"Length"];
    movieevent.eventDateArray=[EventDate movieEventDateFromArray:[movieEventDics objectForKey:@"arrDates"]];
    movieevent.eventVenueArray=[EventVenue movieEventVenueFromArray:[movieEventDics objectForKey:@"arrVenues"]];
    return movieevent;
}
+(NSArray*) movieEventFromArray:(NSArray*)movieEventArray {
	if (!movieEventArray) {
		return Nil;
	}
	
	NSMutableArray *answers = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < movieEventArray.count; i++) {
		MovieEvent *a = [MovieEvent movieEventFromDictionary:[movieEventArray objectAtIndex:i] ];
		if (a) {
			[answers addObject:a];
		}
	}
	
	return answers;
}

@end
