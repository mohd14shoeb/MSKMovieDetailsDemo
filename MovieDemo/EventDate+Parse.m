//
//  EventDate+Parse.m
//  MovieDemo
//
//  Created by survey on 04/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "EventDate+Parse.h"
#import "EventDate.h"
@implementation EventDate (Parse)
+(EventDate*) movieEventDateFromDictionary:(NSDictionary*)movieEventDics{
    
    EventDate *eventdate=[[EventDate alloc]init];
    eventdate.eventCode=[movieEventDics objectForKey:@"EventCode"];
    eventdate.showDateCode=[movieEventDics objectForKey:@"ShowDateCode"];
    eventdate.showDateSisplay=[movieEventDics objectForKey:@"ShowDateDisplay"];
    return eventdate;

}
+(NSArray*) movieEventDateFromArray:(NSArray*)movieEventArray {
    if (!movieEventArray) {
		return Nil;
	}
	
	NSMutableArray *answers = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < movieEventArray.count; i++) {
		EventDate *a =[EventDate movieEventDateFromDictionary:[movieEventArray objectAtIndex:i]];
		if (a) {
			[answers addObject:a];
		}
	}
	return answers;
}

@end
