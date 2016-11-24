//
//  MovieEvent+Parse.h
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "MovieEvent.h"

@interface MovieEvent (Parse)
+(MovieEvent*) movieEventFromDictionary:(NSDictionary*)movieEventDics;
+(NSArray*) movieEventFromArray:(NSArray*)movieEventArray ;
@end
