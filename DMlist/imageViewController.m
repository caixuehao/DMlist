//
//  imageViewController.m
//  DMlist
//
//  Created by duole on 15/9/17.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "imageViewController.h"
#import "VIPhotoView.h"
#import "CAIPuliceFuntion.h"
#import "UIWindow+YUBottomPoper.h"
@interface imageViewController ()

@end

@implementation imageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_image == NULL) {
        [CAIPuliceFuntion showMessage:@"没设置图片image"];
    }
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    VIPhotoView *photoView = [[VIPhotoView alloc] initWithFrame:self.view.bounds andImage:_image];
    photoView.autoresizingMask = (1 << 6) -1;
    [self.view addSubview:photoView];
    //单击事件
    UITapGestureRecognizer* DanJi = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDanJi:)];
    [self.view addGestureRecognizer:DanJi];
    //长按事件
    UILongPressGestureRecognizer* ChangAn = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(imageChangAn:)];
    ChangAn.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:ChangAn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    //单击事件
- (void)imageDanJi:(UITapGestureRecognizer *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

  //长按事件
- (void)imageChangAn:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"长按结束");return;//UIGestureRecognizerStateBegan  长按开始
    }
    [self.view.window  showPopWithButtonTitles:@[@"保存到相册"] styles:@[YUDefaultStyle] whenButtonTouchUpInSideCallBack:^(int index  ) {
        switch (index) {
            case 0:
                UIImageWriteToSavedPhotosAlbum(_image,nil,nil,nil);//保存图片到相册
                [CAIPuliceFuntion showMessage:@"保存图片成功"];//其实我没判断
                break;
            default://取消按钮直接返回
                break;
        }
    }];
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
