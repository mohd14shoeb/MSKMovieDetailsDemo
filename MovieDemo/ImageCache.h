//
//  ImageCache.h
//  MovieDemo
//
//  Created by survey on 05/09/14.
//  Copyright (c) 2014 survey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject
@property (nonatomic, retain) NSCache *imgCache;

+ (ImageCache*)sharedImageCache;
- (void) AddImage:(NSString *)imageURL :(UIImage *)image;
- (UIImage*) GetImage:(NSString *)imageURL;
- (BOOL) DoesExist:(NSString *)imageURL;
@end
