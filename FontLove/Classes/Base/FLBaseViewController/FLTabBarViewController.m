//
//  FLTabBarViewController.m
//  FontLove
//
//  Created by EGLS_BMAC on 2020/11/17.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "FLTabBarViewController.h"
#import "FLNavigationViewController.h"

@interface FLTabBarViewController ()

@end

@implementation FLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setViewController];
    [self setupTabBarColor];
}

- (void)setupTabBarColor {
    UIColor *tabBarBgColor = [UIColor whiteColor];
    [[UITabBar appearance] setBarTintColor:tabBarBgColor];
    [UITabBar appearance].translucent = NO;
    // 未选中状态的标题颜色
    CGFloat fontSize = 12;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName:RGB(164, 164, 164)} forState:UIControlStateNormal];
    // 选中状态的标题颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSForegroundColorAttributeName:RGB(112, 112, 112)} forState:UIControlStateSelected];
}

- (void)setViewController {
    //设置tabbar背景颜色
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor whiteColor]]];

    NSArray *controllers    = @[@"FLMingJuViewController",@"FLZiTiViewController",@"FLDuanYuViewController",@"FLMineViewController"];
    NSArray *titles         = @[@"名句",@"字体",@"短语",@"我的"];
    NSArray *images         = @[@"mingju_normal",@"ziti_normal",@"duanyu_normal",@"mine_normal"];
    NSArray *selectImage    = @[@"mingju_selected",@"ziti_selected",@"duanyu_selected",@"mine_selected"];
    for (int i = 0; i < titles.count; i++) {
        [self setupViewControllerWithControllerString:controllers[i] title:titles[i] image:images[i] andSelectedImage:selectImage[i]];
    }
}

-(void)setupViewControllerWithControllerString:(NSString *)controller title:(NSString *)title image:(NSString *)image andSelectedImage:(NSString *)selectedImage{
    Class class = NSClassFromString(controller);
    UIViewController* viewCon = [[class alloc]init];
    [viewCon setNavHiden:YES];
    FLNavigationViewController* nav = [[FLNavigationViewController alloc] initWithRootViewController:viewCon];
    if (title) {
        viewCon.navigationItem.title = title;
        viewCon.tabBarItem.title = title;
    }
    viewCon.tabBarItem.image            = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewCon.tabBarItem.selectedImage    = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableArray* array = [NSMutableArray arrayWithArray:self.viewControllers];
    [array addObject:nav];
    self.viewControllers = array;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
