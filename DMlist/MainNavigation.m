//
//  MainNavigation.m
//  DMlist
//
//  Created by duole on 15/9/2.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "MainNavigation.h"
#import "BiliBili.h"
@interface MainNavigation ()

@end

@implementation MainNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)drawRect:(CGRect)rect{
   UIImageView* imageview = [[UIImageView alloc] initWithFrame:rect];
    imageview.backgroundColor = [UIColor yellowColor];
//    [self.navigationBar addSubview:imageview];
    [BiliBili ShouYeDaoHangLan:imageview];
//    [self.view addSubview:imageview];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"DHBg0"] forBarMetrics: UIBarMetricsDefault];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent; 
}

+ (void)initialize {



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
