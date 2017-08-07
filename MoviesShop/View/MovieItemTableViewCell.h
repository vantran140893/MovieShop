#import <UIKit/UIKit.h>

@interface MovieItemTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel     *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel     *releaseDateLabel;
@property (nonatomic, weak) IBOutlet UILabel     *ratingLabel;
@property (nonatomic, weak) IBOutlet UILabel     *overviewContentLabel;
@property (nonatomic, weak) IBOutlet UIImageView *posterImageView;
@property (nonatomic, weak) IBOutlet UIImageView *adultImageView;
@property (nonatomic, weak) IBOutlet UIButton    *markedBtn;

@end
