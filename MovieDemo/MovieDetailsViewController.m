//
//  MovieDetailsViewController.m
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "MovieEvent.h"
#import "EventDate.h"
#import "EventVenue.h"
#import "MovieEvent+Parse.h"
#import "EventVenue+Parse.h"
#import "EventDate+Parse.h"
#import "ImageCache.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController
@synthesize movieName,movieImageName,eventSynopsis;
@synthesize makeLabel,imageView;
@synthesize eventDatearray,eventVenuearray1,eventVenueNamearray,eventVenueDistancearray;
@synthesize durationLabel,distanceLabel,showDateLabel,cityLabel,venueLabel;
@synthesize movieevent,eventdates,eventvenues,indexNumber,eventarray;
@synthesize image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
       eventDatearray=[[NSMutableArray alloc]init];
          eventVenuearray1=[[NSMutableArray alloc]init];
         eventVenueNamearray=[[NSMutableArray alloc]init];
         eventVenueDistancearray=[[NSMutableArray alloc]init];
                 eventarray=[[NSMutableArray alloc]init];
    }
  
    return self;
}

- (void)viewDidLoad
{

    
    [super viewDidLoad];
    self.title=[NSString stringWithFormat:@"%@",movieName];
    makeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    makeLabel.numberOfLines =0;
    makeLabel.text=[NSString stringWithFormat:@"%@",eventSynopsis];
    
    movieevent=[eventarray objectAtIndex:indexNumber];
    durationLabel.text=[NSString stringWithFormat:@"%@",movieevent.length];
    
    
    for (EventDate *date in movieevent.eventDateArray ) {
        NSString *dateshow= [NSString stringWithFormat:@"%@",date.showDateSisplay];
        [eventDatearray addObject:dateshow];
    }
showDateLabel.text=[NSString stringWithFormat:@"%@",[eventDatearray objectAtIndex:0]];
    
    for (EventVenue *venue in movieevent.eventVenueArray ) {
      NSString* venuestrName =[NSString stringWithFormat:@"%@",venue.venueName];
        cityLabel.text=[NSString stringWithFormat:@"%@",venue.regin_strName];
        [eventVenueNamearray addObject:venuestrName];
    }

     NSMutableDictionary *mydics=[[NSMutableDictionary alloc]init];
  
    for (EventVenue *venue in movieevent.eventVenueArray ) {
       NSString* venuestrName =[NSString stringWithFormat:@"%@",venue.distance];
        [mydics setValue:venue.distance forKey:venue.venueName];
        [eventVenuearray1 addObject:venuestrName];
    }
    
    NSArray *blockSortedKeys = [mydics keysSortedByValueUsingComparator: ^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    venueLabel.text=[NSString stringWithFormat:@"%@",[blockSortedKeys objectAtIndex:0]];
    
   //    NSLog(@"Sorted Array %@ = %@", blockSortedKeys,mydics);
    
    NSMutableArray *iostutorialguide_sorted = [[NSMutableArray alloc]init];
    [iostutorialguide_sorted  addObjectsFromArray: [eventVenuearray1 sortedArrayUsingSelector:@selector(localizedStandardCompare:)]];
    distanceLabel.text=[NSString stringWithFormat:@"%@",[iostutorialguide_sorted objectAtIndex:0]];
 //  NSLog(@"Sorted Array = %@", iostutorialguide_sorted);

}
-(void)viewWillAppear:(BOOL)animated{

NSURL* url = [NSURL URLWithString:movieImageName];

    if ([[ImageCache sharedImageCache] DoesExist:movieImageName] == true)
    {
        image = [[ImageCache sharedImageCache] GetImage:movieImageName];
         imageView.image = image;
    }
    else
    {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfURL:url];
           image = [UIImage imageWithData:data];
            if (image==nil) {
                }
            else{
            [[ImageCache sharedImageCache] AddImage:movieImageName :image];
            }
                dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = image;
            });
        });
    }
 
}
-(void)dealloc{

    self.movieName=nil;
    self.movieImageName=nil;
    self.eventSynopsis=nil;
    self.makeLabel=nil;
    self.imageView=nil;

    self.eventDatearray=nil;
    self.eventVenuearray1=nil;
    self.eventVenueNamearray=nil;
    self.eventVenueDistancearray=nil;
   
    self.durationLabel=nil;
    self.distanceLabel=nil;
    self.showDateLabel=nil;
    self.cityLabel=nil;
    self.venueLabel=nil;
   
    self.movieevent=nil;
    self.eventdates=nil;
    self.eventvenues=nil;
  
    self.eventarray=nil;
 self.image=nil;
   // [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end
