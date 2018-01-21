//
//  DetailController.m
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import "DetailController.h"
#import "APIManager.h"
#import "MovieCache.h"

@interface DetailController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUp];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) setUp {
  
  self.title = _movie.title;
  
  self.descriptionLabel.text = _movie.moveDescriptionLong;
  [self.descriptionLabel sizeToFit];
  
  UIImage * image = [MovieCache.shared.cache objectForKey:_movie.imageUri];
  
  if (image != nil) {
    self.imageView.image = image;
    
  } else {
    
    [APIManager loadImageFor:_movie completion:^(UIImage *image) {
      dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
        UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
      });
    }];
  }
}

@end
