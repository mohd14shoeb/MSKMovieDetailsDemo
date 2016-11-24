//
//  EventVenue+Parse.m
//  MovieDemo
//
//  Created by survey on 04/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "EventVenue+Parse.h"
#import "EventVenue.h"
@implementation EventVenue (Parse)
+(EventVenue*) movieEventVenueFromDictionary:(NSDictionary*)movieEventDics{
    
    EventVenue *eventvenue=[[EventVenue alloc]init];
    eventvenue.venueName=[movieEventDics objectForKey:@"VenueName"];
    eventvenue.distance=[movieEventDics objectForKey:@"Distance"];
    eventvenue.regin_strName=[movieEventDics objectForKey:@"Region_strName"];
    return eventvenue;

}
+(NSArray*) movieEventVenueFromArray:(NSArray*)movieEventArray {
    
    if (!movieEventArray) {
		return Nil;
	}
	
	NSMutableArray *answers = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < movieEventArray.count; i++) {
		EventVenue *a =[EventVenue movieEventVenueFromDictionary:[movieEventArray objectAtIndex:i]];
		if (a) {
			[answers addObject:a];
		}
	}
	return answers;

}
@end
