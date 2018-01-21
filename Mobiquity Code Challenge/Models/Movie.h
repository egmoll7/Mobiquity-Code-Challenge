//
//  Movie.h
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *movieDescription;
@property (nonatomic, strong) NSString *moveDescriptionLong;
@property (nonatomic, strong) NSString *imageUri;

@end
