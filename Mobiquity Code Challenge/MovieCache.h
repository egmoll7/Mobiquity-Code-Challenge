//
//  MovieCache.h
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieCache : NSObject

@property (strong, nonatomic) NSCache *cache;
+ (MovieCache *) shared;

@end
