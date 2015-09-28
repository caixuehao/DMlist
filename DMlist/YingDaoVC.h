//
//  YingDaoVC.h
//  DMlist
//
//  Created by duole on 15/8/28.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YingDaoVC : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *Page;

@property (strong, nonatomic) IBOutlet UIButton *Btn;

+(BOOL)YingDao;

@property(nonatomic,strong) NSMutableArray* ARR;//引导图片的路径

@end
