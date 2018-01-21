//
//  MovieCache.m
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import "MovieCache.h"

@implementation MovieCache

- (id)init {
  self = [super init];
  if (self) {
    _cache = [NSCache new];
  }
  return self;
}

+ (MovieCache *)shared {
  
  static MovieCache *shared = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    shared = [[MovieCache alloc] init];
  });
  return shared;
}
@end
