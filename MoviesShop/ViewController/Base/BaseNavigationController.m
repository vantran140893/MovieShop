//
//  BaseNavigationController.m
//  MoviesShop
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Custom UINavigationController appearance
    [self.navigationBar setBackgroundImage:[UIImage imageBackgroundTabBar] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor    = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // Custom UINavigationController appearance
    [[UITabBar appearance] setBackgroundImage:[UIImage imageBackgroundTabBar]];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
