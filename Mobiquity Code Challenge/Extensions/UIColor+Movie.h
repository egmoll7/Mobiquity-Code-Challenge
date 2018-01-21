//
//  UIColor+Movie.h
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor ()

+ (UIColor *)moviePurpleColor;

@end

@implementation UIColor (Movie)

+ (UIColor *)moviePurpleColor {
  return [UIColor colorWithRed:97.0/255.0 green:61.0/255.0 blue:193.0/255.0 alpha:1.0];
}

@end
