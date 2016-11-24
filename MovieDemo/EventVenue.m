//
//  EventVenue.m
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "EventVenue.h"

@implementation EventVenue
@synthesize venueName;
@synthesize distance;
@synthesize regin_strName;

-(void)dealloc{
    
    self.venueName=nil;
    self.distance=nil;
    self.regin_strName=nil;
}

@end
