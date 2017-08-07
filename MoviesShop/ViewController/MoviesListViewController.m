//
//  MoviesListViewController.m
//  MoviesShop
//

#import "MoviesListViewController.h"
#import "MovieItemTableViewCell.h"
#import "Movie.h"
#import "MovieEntity.h"

@interface MoviesListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;

@property(nonatomic) NSMutableArray *moviesItemList;

@end

@implementation MoviesListViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        _moviesItemList       = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *movieNib = [UINib nibWithNibName:NSStringFromClass([MovieItemTableViewCell class]) bundle:[NSBundle mainBundle]];
    [self.moviesTableView registerNib:movieNib forCellReuseIdentifier:@"kMovieItemTableViewCellIdentifier"];
    _moviesTableView.delegate = self;
    _moviesTableView.dataSource = self;
    [self fetchMoviesList];
}

#pragma mark - UITableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.moviesItemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kMovieItemTableViewCellIdentifier"];
    cell.markedBtn.tintColor = kDefaultColor;
    
    Movie *movie = [self.moviesItemList objectAtIndex:indexPath.row];
    cell.titleLabel.text = movie.movieTitle;
    cell.ratingLabel.text = [NSString stringWithFormat:@"%.1f/10.0", movie.rating];
    cell.overviewContentLabel.text = movie.movieOverview;
    cell.releaseDateLabel.text = [NSString stringWithFormat:@"%@", movie.releaseDateString];
    
    // show/hide adult icon
    cell.adultImageView.hidden = !movie.isAdult;
    
    // load poster
    if (movie.posterPath.length > 0) {
        [cell.posterImageView sd_setImageWithURL:[NSURL URLWithString:movie.posterPath] placeholderImage:[UIImage imageNamed:@"ic_loading_image"]];
    } else {
        cell.posterImageView.image = [UIImage imageNamed:@"ic_loading_image"];
        
    }
    [cell.markedBtn addTarget:self action:@selector(onBookMarkButtonAction:event:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API

- (void)fetchMoviesList {
    [self.moviesItemList removeAllObjects];
    HttpSessionManager *session = [HttpSessionManager sharedSession];
    
    [session fetchListMoviesPage:1 completion:^(id sender, NetworkCompletionType type, NSDictionary *result) {
        if (type == kNetworkCompletionSuccess) {
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                
                for (NSDictionary *itemDict in [result objectForKey:@"results"]) {
                    Movie *movie = [[Movie alloc] initWithDictionary:itemDict];
                    [self.moviesItemList addObject:movie];
                }
                
                [self.moviesTableView reloadData];
            }
        }
    }];
}

#pragma mark - action

- (void)onBookMarkButtonAction:(id)sender event:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:sender] anyObject];
    NSIndexPath *indexPath = [self.moviesTableView indexPathForRowAtPoint:[touch locationInView:self.moviesTableView]];
    Movie *movie = (Movie *)[self.moviesItemList objectAtIndex:indexPath.row];
    MovieEntity *movieEntity = [MovieEntity MR_createEntity];
    movieEntity.movieId = [NSString stringWithFormat:@"%ld",movie.movieId];
    movieEntity.movieOverview = movie.movieOverview;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
