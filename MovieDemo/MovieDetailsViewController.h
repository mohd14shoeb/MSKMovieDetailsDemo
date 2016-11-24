//
//  MovieDetailsViewController.h
//  MovieDemo
// shoeb
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieEvent;
@class EventDate;
@class EventVenue;

@interface MovieDetailsViewController : UIViewController
@property(nonatomic, retain)MovieEvent *movieevent;
@property(nonatomic, retain)EventVenue *eventvenues;
@property(nonatomic, retain)EventDate *eventdates;
@property(nonatomic, assign)NSInteger indexNumber;
@property(nonatomic,retain)NSString *movieName;
@property(nonatomic,retain)NSString *movieImageName;
@property(nonatomic,retain)NSString *eventSynopsis;
@property (strong, nonatomic) IBOutlet UILabel *makeLabel;
@property (strong, nonatomic) IBOutlet UILabel *showDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *venueLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)NSMutableArray *eventDatearray;
@property (strong, nonatomic)NSMutableArray *eventVenuearray1;
@property (strong, nonatomic)NSMutableArray *eventVenueNamearray;
@property (strong, nonatomic)NSMutableArray *eventVenueDistancearray;
@property (strong, nonatomic)NSMutableArray *eventarray;
@property (strong, nonatomic)UIImage *image;

@end
