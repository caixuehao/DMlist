//
//  XiangXiXingXi.m
//  DMlist
//
//  Created by duole on 15/9/28.
//  Copyright © 2015年 duole. All rights reserved.
//

#import "XiangXiXingXi.h"
#import "UIImageView+WebCache.h"
#import "BaiDu.h"
#import "CAIPuliceFuntion.h"
#import "imageViewController.h"

@interface XiangXiXingXi ()

@end

@implementation XiangXiXingXi
- (IBAction)返回按钮:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)更多按钮:(id)sender {
}
- (IBAction)保存备注按钮:(id)sender {
}

- (IBAction)设置为封面按钮:(id)sender {
    //存入数据
    NSMutableDictionary* Dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:_imageArr[_showImageInt],@"封面" ,nil];
    
    [[BaiDu GetFanWangZhiDIC] setObject:Dic forKey:_ARR[0]];
    //刷新外面的界面
    [BaiDu setFenMian3:_Rootcell.imageview CiTiao:_ARR[0]];
    //通知用户
    [CAIPuliceFuntion showMessage:@"成功设置封面"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _w = [[UIScreen mainScreen] bounds].size.width;
    _imageInt  = 0;//当前显示的图片数量
    _showImageInt = 0;//当前显示的图片索引(0开始)
    
    //获取封面
    NSMutableDictionary* Dic =  [[BaiDu GetFanWangZhiDIC] objectForKey:_ARR[0]];
    NSString * str = [Dic objectForKey:@"封面"];
    
    //把数据加到数组中
    _imageArr = [[NSMutableArray alloc] initWithObjects:str, nil];
    _imageViewArr = [[NSMutableArray alloc] init];
    
    
    
    
    //设置名字
    self.nameLabel.text = _ARR[0];
    //设置备注
    self.BeiZhuTextView.text = _ARR[1];
    //设置封面滚动视图
    _FengMainScrollView.showsHorizontalScrollIndicator = FALSE;//设置滚动条隐藏
    _FengMainScrollView.pagingEnabled = YES;//设置是否分页
    _FengMainScrollView.delegate = self; //设置代理
    //保存备注按钮禁用
    [_SetBeiZhuBtn setEnabled:NO];
    
    
    
    
    
    
    //封面图片单击事件
    _FengMainScrollView.userInteractionEnabled = YES;
    UITapGestureRecognizer* DanJi = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDanJi:)];
    //    DanJi.numberOfTapsRequired = 2;//双击
    [_FengMainScrollView addGestureRecognizer:DanJi];
    
    //在视图上增加图片
    [self addFMImage];
    
    
    
    //预览后两个
    [BaiDu getImageArr:^(NSString *imageStr) {
        [_imageArr addObject:imageStr];//先加到数组中去
        
        if(_imageArr.count <= _showImageInt+3){
            [self addFMImage];
        }
        
        
    } CiTiao:_ARR[0]];
    
    //键盘添加代理
    //使用NSNotificationCenter 键盘出现时
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    //使用NSNotificationCenter 键盘隐藏时
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    
}
//单机封面图片
- (void)imageDanJi:(UITapGestureRecognizer *)sender{
    imageViewController* imagevc  = [[imageViewController alloc] init];
    UIImageView* iv = _imageViewArr[_showImageInt];
    imagevc.image = iv.image;
    [self.navigationController pushViewController:imagevc animated:YES];
}
//封面视图滑动判断
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _showImageInt = (int)(scrollView.contentOffset.x/scrollView.frame.size.width);
    int ii = _showImageInt+3 - _imageInt;
    if (ii>0) {
        while (ii--) {
            [self addFMImage];
        }
    }
    UIImageView* iv = _imageViewArr[_showImageInt];
    UIImage* image = iv.image;
    _imageSizeLabel.text = [[NSString alloc] initWithFormat:@"宽:%.0f,高:%.0f",image.size.width,image.size.height];
    //    NSLog(@"第%d页",(int)(scrollView.contentOffset.x/_w+1));
    NSLog(@"%ld,%d,%d",_imageArr.count,_imageInt,_showImageInt);
}
//增加图片
-(void)addFMImage{
    //    NSLog(@"X%d",_imageInt);
    if (_imageArr.count<=_imageInt) {
        return;
    }
    //    创建新的iamgeview
    UIImageView *FengMianImage = [[UIImageView alloc] initWithFrame:CGRectMake(_imageInt*_FengMainScrollView.frame.size.width, 0, _FengMainScrollView.frame.size.width, _FengMainScrollView.frame.size.height)];
    _imageInt++;
    [FengMianImage sd_setImageWithURL:[[NSURL alloc] initWithString:_imageArr[_imageInt-1]] placeholderImage:[UIImage imageNamed:@"锁链背景图"]];
    
    //    增加长度
    _FengMainScrollView.contentSize = CGSizeMake(_w*_imageInt, _FengMainScrollView.frame.size.height);
    [FengMianImage setContentMode:UIViewContentModeScaleAspectFit];
    [_FengMainScrollView addSubview:FengMianImage];
    
    //   保存句柄
    [_imageViewArr addObject:FengMianImage];
    //    NSLog(@"Y%d",_imageInt);
    
    
}
#pragma mark -UITextViewDelegate

//实现当键盘出现的时候计算键盘的高度大小。用于输入框显示位置
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"hight_hitht:%f",kbSize.height);
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.3];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, -kbSize.height, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_BeiZhuTextView resignFirstResponder];
}
//当键盘隐藏的时候
- (void)keyboardWillBeHidden:(NSNotification*)aNotification{
    
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.3];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}
//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [_BeiZhuTextView resignFirstResponder];
    NSLog(@"1");
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
