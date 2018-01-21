//
//  APIManager.h
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Movie.h"

@interface APIManager : NSObject

+ (void) loadMoviesWithCompletion:(void(^)(NSMutableArray *movies))completion;
+ (void) loadImageFor:(Movie *)movie completion:(void(^)(UIImage *image))completion;

@end
