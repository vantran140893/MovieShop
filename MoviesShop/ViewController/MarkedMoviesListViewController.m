//
//  MarkedMoviesListViewController.m
//  MoviesShop
//

#import "MarkedMoviesListViewController.h"
#import "MovieItemTableViewCell.h"
#import "Movie.h"
#import "MovieEntity.h"

@interface MarkedMoviesListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *markedMoviesTableView;

@property(nonatomic) NSMutableArray *markedMoviesItemList;

@end

@implementation MarkedMoviesListViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        _markedMoviesItemList       = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINib *movieNib = [UINib nibWithNibName:NSStringFromClass([MovieItemTableViewCell class]) bundle:[NSBundle mainBundle]];
    [self.markedMoviesTableView registerNib:movieNib forCellReuseIdentifier:@"kMovieItemTableViewCellIdentifier"];
    _markedMoviesTableView.delegate = self;
    _markedMoviesTableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self fetchMarkedMoviesList];
}

#pragma mark - UITableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.markedMoviesItemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kMovieItemTableViewCellIdentifier"];
    cell.markedBtn.tintColor = kDefaultColor;
    
    Movie *movie = [self.markedMoviesItemList objectAtIndex:indexPath.row];
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
        cell.posterImageView.image = [UIImage imageNamed:@"ic_placeholder"];
        
    }
    cell.markedBtn.hidden = YES;
    
    return cell;
}

#pragma mark - API

- (void)fetchMarkedMoviesList {
    [self.markedMoviesItemList removeAllObjects];
    NSMutableArray * moviesItemList       = [NSMutableArray array];
    NSArray *markedMovieEntitys = [MovieEntity MR_findAll];

    if (markedMovieEntitys.count == 0) {
        return;
    }
    
    HttpSessionManager *session = [HttpSessionManager sharedSession];
    
    [session fetchListMoviesPage:1 completion:^(id sender, NetworkCompletionType type, NSDictionary *result) {
        if (type == kNetworkCompletionSuccess) {
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                for (NSDictionary *itemDict in [result objectForKey:@"results"]) {
                    Movie *movie = [[Movie alloc] initWithDictionary:itemDict];
                    [moviesItemList addObject:movie];
                }
                [moviesItemList enumerateObjectsUsingBlock:^(Movie * _Nonnull movie, NSUInteger idx, BOOL * _Nonnull stop) {
                    [markedMovieEntitys enumerateObjectsUsingBlock:^(MovieEntity *  _Nonnull movieEntity, NSUInteger idx, BOOL * _Nonnull stop) {
                        if(movie.movieId == movieEntity.movieId.integerValue){
                            [self.markedMoviesItemList addObject:movie];
                        }
                    }];
                }];
                [self.markedMoviesTableView reloadData];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
