//
//  MovieEvent.m
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "MovieEvent.h"

@implementation MovieEvent

@synthesize actors;
@synthesize eventTitle;
@synthesize bannerURL;
@synthesize language;
@synthesize genre;
@synthesize eventSynopsis;
@synthesize director;
@synthesize length;



-(void)dealloc{
  
    self.actors=nil;
    self.language=nil;
    self.bannerURL=nil;
    self.eventTitle=nil;
    self.genre=nil;
    self.eventSynopsis=nil;
    self.director=nil;
    self.length=nil;


}
@end
