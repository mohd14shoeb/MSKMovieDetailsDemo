//
//  MovieDemoViewController.h
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieEvent+Parse.h"
#import "MovieDetailsViewController.h"

@class MovieEvent;
@class EventDate;
@class EventVenue;

@interface MovieDemoViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{
   
    
}
@property(nonatomic, retain)MovieEvent *movieevent;
@property(nonatomic, retain)EventVenue *eventvenues;
@property(nonatomic, retain)EventDate *eventdates;
@property(nonatomic,retain)IBOutlet UITableView *movieListTable;
@property (strong, nonatomic) IBOutlet UILabel *languageLabel;
@property (strong, nonatomic) IBOutlet UILabel *actorLabel;
@property (strong, nonatomic) IBOutlet UILabel *movieCategoryLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *movieListArray;
@property (strong, nonatomic) NSMutableArray *arrEvent;
@property (strong, nonatomic) NSMutableArray *arrVenues;
@property (strong, nonatomic) NSMutableArray *arrDates;
@property (strong, nonatomic)NSMutableDictionary *jsonObject;
@property (strong, nonatomic)NSMutableDictionary* dicsEvent;
@property(nonatomic, retain)UIAlertView * alert;
@property(nonatomic, retain)UIActivityIndicatorView *activityIndicator;
@property(nonatomic, retain) UIView*   overlayView;

@end
