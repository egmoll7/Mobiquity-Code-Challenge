//
//  MovieCell.h
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void) populateWith:(Movie *)movie;

@end
