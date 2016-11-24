//
//  EventVenue+Parse.h
//  MovieDemo
//
//  Created by survey on 04/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "EventVenue.h"

@interface EventVenue (Parse)
+(EventVenue*) movieEventVenueFromDictionary:(NSDictionary*)movieEventDics;
+(NSArray*) movieEventVenueFromArray:(NSArray*)movieEventArray ;
@end
