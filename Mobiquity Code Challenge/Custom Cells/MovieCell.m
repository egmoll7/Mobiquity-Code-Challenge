//
//  MovieCell.m
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import "MovieCell.h"
#import "APIManager.h"
#import "MovieCache.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) populateWith:(Movie *)movie {
  
  self.titleLabel.text = movie.title;
  self.descriptionLabel.text = movie.movieDescription;
  UIImage * image = [MovieCache.shared.cache objectForKey:movie.imageUri];
  
  
  if (image != nil) {
    self.imageView.image = image;
    
  } else {
    
    [APIManager loadImageFor:movie completion:^(UIImage *image) {
      dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
        UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
      });
    }];
  }
}

@end
