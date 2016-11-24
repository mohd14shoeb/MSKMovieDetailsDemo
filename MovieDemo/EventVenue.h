//
//  EventVenue.h
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieEvent;
@interface EventVenue : NSObject
@property (strong, nonatomic) NSString *venueName;
@property(nonatomic,assign)NSNumber *distance;
@property (strong, nonatomic) NSString *regin_strName;
@end
