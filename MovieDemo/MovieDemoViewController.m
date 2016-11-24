//
//  MovieDemoViewController.m
//  MovieDemo
//
//  Created by survey on 03/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import "MovieDemoViewController.h"
#import "MovieEvent.h"
#import "EventDate.h"
#import "EventVenue.h"
#import "MovieEvent+Parse.h"
#import "EventVenue+Parse.h"
#import "EventDate+Parse.h"

@interface MovieDemoViewController ()

@end

@implementation MovieDemoViewController
@synthesize movieListTable,movieListArray,jsonObject;
@synthesize arrDates,arrVenues,arrEvent,dicsEvent;
@synthesize actorLabel,languageLabel,movieCategoryLabel,imageView;
@synthesize eventdates,eventvenues,movieevent;
@synthesize activityIndicator,overlayView,alert;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Movie";
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Refresh"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(eventVenueDetails)];
    
    self.navigationItem.rightBarButtonItem = barButton;
    arrVenues=[[NSMutableArray alloc]init];
    arrDates=[[NSMutableArray alloc]init];
    arrEvent=[[NSMutableArray alloc]init];
    
    //http://data.in.bookmyshow.com/getData.aspx?cc=&cmd=GETEVENTLIST&dt=&et=MT&f=json&lg=72.842588&lt=19.114186&rc=MUMBAI&sr=&t=a54a7b3aba576256614a
    
	   
    self.overlayView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.overlayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityIndicator.center = self.overlayView.center;
    [self.overlayView addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    [self.movieListTable addSubview:self.overlayView];
alert =[[UIAlertView alloc ] initWithTitle:@"Warning"
                                                     message:@"The Internet connection appears to be offline"
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles: nil];
//
//    NSURL* url = [NSURL URLWithString:@"http://data.in.bookmyshow.com/getData.aspx?cc=&cmd=GETEVENTLIST&dt=&et=MT&f=json&lg=72.842588&lt=19.114186&rc=MUMBAI&sr=&t=a54a7b3aba576256614a"];

    [self eventVenueDetails];
}

-(void)allMovieEventDetails:(NSMutableDictionary*)myDics{
    arrEvent=[[NSMutableArray alloc]init];
   dicsEvent=[[NSMutableDictionary alloc]init];
    
    NSMutableArray * array=[jsonObject objectForKey:@"BookMyShow"];
    dicsEvent= [array valueForKey:@"arrEvent"];
    for (NSDictionary *dir in dicsEvent ) {
        MovieEvent *event=[MovieEvent movieEventFromDictionary:dir];
        [arrEvent addObject:event];
    }
 
   //    NSLog(@" %@ %d", arrEvent,[arrEvent count]);
    
}


-(void)eventVenueDetails{
    [self.activityIndicator startAnimating];
    
    NSURL* url = [NSURL URLWithString:@"https://data.in.bookmyshow.com/getData.aspx?cc=&cmd=GETEVENTLIST&dt=&et=MT&f=json&lg=72.842588&lt=19.114186&rc=MUMBAI&sr=&t=a54a7b3aba576256614a"];
   // NSMutableURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
  
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
 //   [request setValue:@"application/json" forHTTPHeaderField:@"accept"];
 //   [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:queue
                           completionHandler:^(NSURLResponse* response,
                                               NSData* data,
                                               NSError* error)
     {
         if (data) {
             NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
             NSRange range = [response.MIMEType rangeOfString:@"application/json"];
             
             if (httpResponse.statusCode == 200 /* OK */ && range.length != 0) {
                 NSError* error;
                 jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                 if (jsonObject) {
                     dispatch_async(dispatch_get_main_queue(), ^{
                         
                         [self allMovieEventDetails:jsonObject];
                         [self.overlayView setAlpha:0.0];
                         [self.activityIndicator stopAnimating];
                         [self eventVenueDetails];
                         [movieListTable reloadData];
                     });
                 } else {
                     dispatch_async(dispatch_get_main_queue(), ^{
                         //[self handleError:error];
                         NSLog(@"ERROR: %@", error);
                     });
                 }
             }
             else {
                 // status code indicates error, or didn't receive type of data requested
                 NSString* desc = [[NSString alloc] initWithFormat:@"HTTP Request failed with status code: %d (%@)",
                                   (int)(httpResponse.statusCode),
                                   [NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]];
                 NSError* error = [NSError errorWithDomain:@"HTTP Request"
                                                      code:-1000
                                                  userInfo:@{NSLocalizedDescriptionKey: desc}];
                 dispatch_async(dispatch_get_main_queue(), ^{
                     //[self handleError:error];  // execute on main thread!
                     NSLog(@"ERROR: %@", error);
                 });
             }
         }
         else {
             // request failed - error contains info about the failure
             dispatch_async(dispatch_get_main_queue(), ^{
                 //[self handleError:error]; // execute on main thread!
                 NSLog(@"ERROR:......... %@", error);
                
                 //  [alert addButtonWithTitle:@"GOO"];
                 [alert show];
             });
         }
     }];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrEvent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    static NSInteger imageTag = 1;
    static NSInteger languageTag = 2;
    static NSInteger starTag = 3;
    static NSInteger movieCategoryTag = 4;


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
        languageLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 12, 150, 16)];
        languageLabel.textColor = [UIColor blackColor];
        languageLabel.font = [UIFont systemFontOfSize:13.0];
        languageLabel.tag = languageTag;
        [languageLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:languageLabel];
        
        
        movieCategoryLabel= [[UILabel alloc] initWithFrame:CGRectMake(170, 12, 150, 16)];
        movieCategoryLabel.textColor = [UIColor blackColor];
        movieCategoryLabel.font = [UIFont systemFontOfSize:13.0];
        movieCategoryLabel.lineBreakMode = NSLineBreakByWordWrapping;
        movieCategoryLabel.numberOfLines =0;
        movieCategoryLabel.tag = movieCategoryTag;
        [languageLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:movieCategoryLabel];

       
        imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 60, 20, 20)];
        imageView.layer.cornerRadius = 10.0;
        imageView.layer.masksToBounds=YES;
        imageView.tag=imageTag;
        [cell.contentView addSubview:imageView];
        
        
        actorLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 60, 280, 30)];
        actorLabel.textColor = [UIColor blackColor];
        actorLabel.font = [UIFont systemFontOfSize:12.0];
        actorLabel.lineBreakMode = NSLineBreakByWordWrapping;
        actorLabel.numberOfLines =0;
        actorLabel.tag = starTag;
        [actorLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:actorLabel];

        
    }
    
    MovieEvent*event  = [arrEvent objectAtIndex:indexPath.row];
    cell.textLabel.text=event.eventTitle;
    
    languageLabel = (UILabel *) [cell.contentView viewWithTag:languageTag];
    languageLabel.text = [NSString stringWithFormat:@"%@ ", event.language];
    
    movieCategoryLabel = (UILabel *) [cell.contentView viewWithTag:movieCategoryTag];
    movieCategoryLabel.text = [NSString stringWithFormat:@"%@ ", event.genre];
    
    NSString* star=@":  ";
    imageView= (UIImageView *) [cell.contentView viewWithTag:imageTag];
    [imageView setImage:[UIImage imageNamed:@"star_gold.png"]];

    actorLabel = (UILabel *) [cell.contentView viewWithTag:starTag];
   actorLabel.text =[star stringByAppendingString:[NSString stringWithFormat:@"%@ ", event.actors]];

       return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    MovieDetailsViewController *movie=[[MovieDetailsViewController alloc]initWithNibName:@"MovieDetailsViewController" bundle:nil];
    movie.movieName=[[dicsEvent valueForKey:@"EventTitle"] objectAtIndex:indexPath.row];
    movie.movieImageName=[[dicsEvent valueForKey:@"BannerURL"] objectAtIndex:indexPath.row];
    
    MovieEvent*event  = [arrEvent objectAtIndex:indexPath.row];
    movie.eventSynopsis=[NSString stringWithFormat:@"%@",event.eventSynopsis];
    
    movie.eventarray=[arrEvent mutableCopy];
    movie.indexNumber=indexPath.row;
 [self.navigationController pushViewController:movie animated:YES];
 }
-(void)dealloc{

    self.movieListTable=nil;
    self.movieListArray=nil;
    self.jsonObject=nil;
    self.arrDates=nil;
    self.arrVenues=nil;
    self.arrEvent=nil;
    self.dicsEvent=nil;
    self.actorLabel=nil;
    self.languageLabel=nil;
    self.movieCategoryLabel=nil;
    self.imageView=nil;
    self.eventdates=nil;
    self.eventvenues=nil;
    self.movieevent=nil;
    self.activityIndicator=nil;
    self.overlayView=nil;


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
