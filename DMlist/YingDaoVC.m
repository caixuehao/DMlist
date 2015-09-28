//
//  YingDaoVC.m
//  DMlist
//
//  Created by duole on 15/8/28.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "YingDaoVC.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "MainVC.h"

@interface YingDaoVC ()

@end

@implementation YingDaoVC

+(BOOL)YingDao{

//    return YES;
//    BOOL BL = NO;
    //判断路径是否正确
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   
    NSString *plistPath1 = [paths objectAtIndex:0];
//     NSString *plistPath1 = NSHomeDirectory();
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"YingDao.plist"];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: filename] == NO)
    {
        NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@(0),@"是否引导" ,nil];
        [dic writeToFile:filename atomically:YES];
    }else
    {
         NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
        if([data valueForKey:@"是否引导"])
        {
            NSLog(@"不引导！");
            return NO;
        }
    }
//    NSLog(@"引导！");
//    YingDaoVC *YD = [[YingDaoVC alloc] init];
//    [[UIApplication sharedApplication].keyWindow addSubview:YD.view];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self YingDaoIamge];
    
    
    float w = [[UIScreen mainScreen] bounds].size.width;
    float h = [[UIScreen mainScreen] bounds].size.height;
    
    //设置内容界面大小
    self.ScrollView.contentSize = CGSizeMake(w*_ARR.count+1,h);
    //设置滚动条隐藏
     self.ScrollView.showsHorizontalScrollIndicator = FALSE;
    //设置是否分页
     self.ScrollView.pagingEnabled = YES;
    //设置代理
    self.ScrollView.delegate = self;
    
    for(int i=0;i<_ARR.count;i++){
        UIImageView  *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(w*i, 0,w, h)];
        [imageView setImage:[UIImage imageNamed:_ARR[i]]];
        [self.ScrollView addSubview:imageView];
    }
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(w*_ARR.count, 0,w, h)];
    view.backgroundColor = [UIColor whiteColor];
    [self.ScrollView addSubview:view];
    
    //＋＋＋＋＋创建页点＋＋＋＋＋
//    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"YDPage" owner:nil options:nil];
//    _Page = [views lastObject];
    //设置多少个白点
    _Page.numberOfPages = _ARR.count;
    //设置位置
    [_Page setCenter:CGPointMake(w/2, h-40)];
    [self.view addSubview:_Page];
   
    //＋＋＋＋＋按钮＋＋＋＋＋
    _Btn.frame = CGRectMake(w-70, h-50, 60, 40);
    [self.view addSubview:_Btn];

}

//同步下方page控件；
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int c = floor((self.ScrollView.contentOffset.x - self.view.frame.size.width/2)/self.view.frame.size.width)+1;
    self.Page.currentPage = c;
    
}
//判断是不是在像最右的视图滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    if (scrollView.contentOffset.x>scrollView.contentSize.width-self.view.frame.size.width) {
        [self btn:_Btn];
    }
}
//获取引导页面的图片资源数组
- (NSMutableArray*)YingDaoIamge{
    _ARR = [[NSMutableArray alloc] init];
    for (int i = 0; 1; i++) {
        NSString* FileName = [[NSString alloc] initWithFormat:@"YingDao%d",i];
        
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:FileName ofType:@"png"];
        if (imagePath){ [_ARR addObject:imagePath]; continue;}
        
        imagePath = [[NSBundle mainBundle] pathForResource:FileName ofType:@"jpg"];
        if (imagePath){ [_ARR addObject:imagePath]; continue;}
        
        imagePath = [[NSBundle mainBundle] pathForResource:FileName ofType:@"jpeg"];
        if (imagePath){ [_ARR addObject:imagePath]; continue;}
        
        break;
    }
  
    
    return _ARR;
}
//跳回主界面
- (IBAction)btn:(id)sender {
    [self setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
//    UINavigationController *MVC = [[UINavigationController alloc] initWithRootViewController:[[MainVC alloc] init]];
//
//    [self addChildViewController:MVC]; 
//    //    [MVC setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//    
////     [self didMoveToParentViewController:MVC];
////    [self presentModalViewController:MVC animated:YES];
//      [self presentViewController:MVC animated:YES completion:^{
//  
//    }];
    

//    [UIView animateWithDuration:2 animations:^{
//        self.view.alpha = 0;
//    }];
//    
//    [UIView beginAnimations:@"YDanimtions" context:nil];
//    [UIView setAnimationDuration:1];
//    [UIView setAnimationDelegate:self];
//     self.view.alpha = 0;
//    [UIView commitAnimations];
    
}
//-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//
////    [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[MainVC alloc] init]];
//  }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
