//
//  MoviesViewController.m
//  Mobiquity Code Challenge
//
//  Created by Eduardo Moll on 1/20/18.
//  Copyright © 2018 Eduardo Moll. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "APIManager.h"
#import "DetailController.h"


@interface MoviesViewController () <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating>

@property NSMutableArray *movies;
@property NSMutableArray *filteredMovies;
@property UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void) setUp;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUp];
  
  _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
  _searchController.searchResultsUpdater = self;
  _searchController.obscuresBackgroundDuringPresentation = false;
  _searchController.searchBar.placeholder = @"Search";
  self.navigationItem.searchController = _searchController;
  self.definesPresentationContext = YES;
}

#pragma mark - Private Methods
- (void)setUp {
  
  self.title = @"Movies";
  
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.tableView.tableFooterView = [[UIView alloc] init];
  [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
  self.tableView.rowHeight = 100;
  
  [APIManager loadMoviesWithCompletion:^(NSMutableArray *movies) {
    self.movies = movies;
    
    dispatch_async(dispatch_get_main_queue(), ^{
      UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
      [self.tableView reloadData];
    });
  }];
}

- (BOOL) searchBarIsEmpty {
  return _searchController.searchBar.text.length <= 0;
}

- (void) filterMovies:(NSString *)searchText {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS[cd] %@", searchText];
  self.filteredMovies = (NSMutableArray *)[self.movies filteredArrayUsingPredicate:predicate];
  
  [self.tableView reloadData];
}

- (BOOL) isFiltering {
  return _searchController.isActive && ![self searchBarIsEmpty];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqualToString:@"movieDetail"]) {
    DetailController *detailVC = (DetailController *)segue.destinationViewController;
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    
    if ([self isFiltering]) {
      detailVC.movie = _filteredMovies[indexPath.row];
      
    } else {
      detailVC.movie = _movies[indexPath.row];
    }
    
    
  }
}

#pragma mark - TableView Data Source Methods
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  if ([self isFiltering]) {
    return _filteredMovies.count;
  }
  
  return _movies.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
  Movie *currentMovie;
  
  if ([self isFiltering]) {
    currentMovie = _filteredMovies[indexPath.row];
  } else {
    currentMovie = _movies[indexPath.row];
  }
  
  [cell populateWith:currentMovie];
  
  return cell;
}

#pragma mark - TableView Delegate Methods
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self performSegueWithIdentifier:@"movieDetail" sender:nil];
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Search Controller Delegate
- (void) updateSearchResultsForSearchController:(UISearchController *)searchController {
  [self filterMovies:searchController.searchBar.text];
}

@end
