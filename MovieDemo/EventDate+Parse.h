//
//  EventDate+Parse.h
//  MovieDemo
//
//  Created by survey on 04/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "EventDate.h"

@interface EventDate (Parse)
+(EventDate*) movieEventDateFromDictionary:(NSDictionary*)movieEventDics;
+(NSArray*) movieEventDateFromArray:(NSArray*)movieEventArray ;
@end
