//
//  EventDate.m
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "EventDate.h"

@implementation EventDate

@synthesize showDateSisplay,showDateCode,eventCode;

-(void)dealloc{
    
    self.showDateCode=nil;
    self.eventCode=nil;
    self.showDateSisplay=nil;
    
}

@end
