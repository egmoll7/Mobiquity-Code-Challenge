//
//  APIManager.m
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import "APIManager.h"
#import "Constants.h"
#import "MovieCache.h"

@implementation APIManager

/// Loads all movies
+(void) loadMoviesWithCompletion:(void (^)(NSMutableArray *))completion {

  NSURL *url = [NSURL URLWithString:URL];
  
  UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
  [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (error != nil) {
      NSLog(@"%@", error);
      return;
    }
    
    NSMutableArray *movies = [NSMutableArray new];    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

    for ( NSDictionary *currentMovie in json) {
      Movie *movie = [[Movie alloc] init];
      movie.title = currentMovie[@"title"];
      movie.movieDescription = currentMovie[@"shortDescription"];
      movie.moveDescriptionLong = currentMovie[@"longDescription"];
      movie.imageUri = currentMovie[@"preferredImage"][@"uri"];
      
      [movies addObject:movie];
    }
    
    
    completion(movies);
  }] resume];
}


/// Loads the poster image for the specified movie
+ (void) loadImageFor:(Movie *)movie completion:(void (^)(UIImage *))completion {
  
  UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSString *urlString = [IMAGE_URL stringByAppendingString:movie.imageUri];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];

    [MovieCache.shared.cache setObject:image forKey:movie.imageUri];
    completion(image);
  });
}
@end
