//
//  XiangXiYingXi.m
//  DMlist
//
//  Created by duole on 15/8/27.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "XiangXiYingXi.h"
#import "UIImageView+WebCache.h"
#import "BaiDu.h"
#import "CAIPuliceFuntion.h"
#import "imageViewController.h"
#import "XiangXiXingXi.h"

@interface XiangXiYingXi ()

@end

@implementation XiangXiYingXi
//-(id)initWithName:(NSString*)Name BeiZhu:(NSString*)BeiZhu{
//    self = [super init];
//    if (self) {
//        self.Name.text = Name;
//        self.BeiZhu.text = BeiZhu;
//    }
//    return self;
//}

- (void)viewDidLoad {
    CGRect frame;
    
    _w = [[UIScreen mainScreen] bounds].size.width;
    float h = [[UIScreen mainScreen] bounds].size.height;
    _imageInt  = 0;
    _showImageInt = 0;
    
    NSMutableDictionary* Dic =  [[BaiDu GetFanWangZhiDIC] objectForKey:_ARR[0]];
    NSString * str = [Dic objectForKey:@"封面"];
    _imageArr = [[NSMutableArray alloc] initWithObjects:str, nil];
     _imageViewArr = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    //设置返回按钮
    [_FanHui setBackgroundImage:[UIImage imageNamed:@"Quiticon"] forState:UIControlStateNormal];//设置正常状态
    
    //设置名字
    self.Name.text = _ARR[0];
    //名字背景
    UIImageView *nameBg = [[UIImageView alloc]initWithFrame:_Name.frame];
    nameBg.image = [UIImage imageNamed:@"红色标签背景.png"];
    [nameBg setContentMode:UIViewContentModeScaleToFill];
    [self.DH addSubview:nameBg];
    [self.DH addSubview:_Name];
    
    //设置备注
    self.BeiZhu.text = _ARR[1];
    //备注背景
    UIImageView *bzBg = [[UIImageView alloc]initWithFrame:_BeiZhu.frame];
    bzBg.image = [UIImage imageNamed:@"魔法阵输入背景.jpg"];
    [self.view addSubview:bzBg];
    [self.view addSubview:_BeiZhu];
    self.BeiZhu.delegate = self;//设置代理
    
    //设置封面
    _FMscr.frame = CGRectMake(_FMscr.frame.origin.x, _FMscr.frame.origin.y, _w, h/2);
    _FMscr.contentSize = CGSizeMake(_w, _FMscr.frame.size.height);
    _FMscr.showsHorizontalScrollIndicator = FALSE;//设置滚动条隐藏
    _FMscr.pagingEnabled = YES;//设置是否分页
    _FMscr.delegate = self; //设置代理
    
    //封面背景
    frame = _FMscr.frame;
    frame.size.width = _w;
    frame.size.height = frame.size.height+10;
    frame.origin.x = 0;
    frame.origin.y = frame.origin.y-5;
    
    UIImageView *fmBg = [[UIImageView alloc]initWithFrame:frame];
    fmBg.image = [UIImage imageNamed:@"相框"];
    [self.view addSubview:fmBg];
    
    //图片大小标签背景
    frame= _imageSize.frame;
    frame.origin.x = frame.origin.x-5;
    frame.size.width = frame.size.width+10;
    UIImageView *imageSizeBg = [[UIImageView alloc]initWithFrame:frame];
    imageSizeBg.image = [UIImage imageNamed:@"灰色输入框"];
    [self.view addSubview:imageSizeBg];
    [self.view addSubview:_imageSize];
    
    //设置封面按钮背景
    [_setFengMian setBackgroundImage:[UIImage imageNamed:@"红色按钮.png"] forState:UIControlStateNormal];
     //保存备注按钮背景
    [_BaoChunBeiZhu setBackgroundImage:[UIImage imageNamed:@"红色按钮.png"] forState:UIControlStateNormal];
    
    
    //单击事件
     _FMscr.userInteractionEnabled = YES;
    UITapGestureRecognizer* DanJi = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDanJi:)];
//    DanJi.numberOfTapsRequired = 2;//双击
    [_FMscr addGestureRecognizer:DanJi];
    
    [self addFMImage];
    
    //预览后两个
    [BaiDu getImageArr:^(NSString *imageStr) {
        [_imageArr addObject:imageStr];//先加到数组中去
        
        if(_imageArr.count <= _showImageInt+3){
            [self addFMImage];
        }
        
        
    } CiTiao:_ARR[0]];
    
    //键盘添加代理？
    
    //使用NSNotificationCenter 鍵盤出現時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)imageDanJi:(UITapGestureRecognizer *)sender{
    imageViewController* imagevc  = [[imageViewController alloc] init];
    UIImageView* iv = _imageViewArr[_showImageInt];
    imagevc.image = iv.image;
    [self.navigationController pushViewController:imagevc animated:YES];
}
- (IBAction)baoChunBeizhu:(id)sender {
    [self.navigationController pushViewController:[[XiangXiXingXi alloc]init] animated:YES];
    
}
//增加图片
-(void)addFMImage{
//    NSLog(@"X%d",_imageInt);
    if (_imageArr.count<=_imageInt) {
        return;
    }
//    创建新的iamgeview
    UIImageView *FengMianImage = [[UIImageView alloc] initWithFrame:CGRectMake(_imageInt*_FMscr.frame.size.width, 0, _FMscr.frame.size.width, _FMscr.frame.size.height)];
    _imageInt++;
    [FengMianImage sd_setImageWithURL:[[NSURL alloc] initWithString:_imageArr[_imageInt-1]] placeholderImage:[UIImage imageNamed:@"锁链背景图"]];
    
//    增加长度
    _FMscr.contentSize = CGSizeMake(_w*_imageInt, _FMscr.frame.size.height);
    [FengMianImage setContentMode:UIViewContentModeScaleAspectFit];
    [_FMscr addSubview:FengMianImage];

//   保存句柄
    [_imageViewArr addObject:FengMianImage];
//    NSLog(@"Y%d",_imageInt);


}


//滑动判断
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
    _imageSize.text = [[NSString alloc] initWithFormat:@"宽:%.0f,高:%.0f",image.size.width,image.size.height];
//    NSLog(@"第%d页",(int)(scrollView.contentOffset.x/_w+1));
    NSLog(@"%ld,%d,%d",_imageArr.count,_imageInt,_showImageInt);
}

- (IBAction)shouChang:(id)sender {
    [[CAIPuliceFuntion sharedCAI] addAlbum];
}
//返回
- (IBAction)back:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//设置封面
- (IBAction)setFMimage:(id)sender {
    //存入数据
    NSMutableDictionary* Dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:_imageArr[_showImageInt],@"封面" ,nil];

    [[BaiDu GetFanWangZhiDIC] setObject:Dic forKey:_ARR[0]];
    //刷新外面的界面
    [BaiDu setFenMian3:_Rootcell.imageview CiTiao:_ARR[0]];
}
//下载照片
- (IBAction)DownloadImage:(id)sender {
    [[CAIPuliceFuntion sharedCAI] DownloadImage:_imageArr[_showImageInt]];
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
    [_BeiZhu resignFirstResponder];
}
//当键盘隐藏的时候
- (void)keyboardWillBeHidden:(NSNotification*)aNotification{


    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.3];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}


////开始编辑输入框的时候，软键盘出现，执行此事件
//-(void)textViewDidBeginEditing:(UITextView *)textView{
//    CGRect frame = _BeiZhu.frame;
//    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
//    
//    NSTimeInterval animationDuration = 0.30f;
//    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    
//    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
//    if(offset > 0)
//        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
//    
//    [UIView commitAnimations];
//}
//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [_BeiZhu resignFirstResponder];
    NSLog(@"1");
    return YES;
}
////输入框编辑完成以后，将视图恢复到原始状态
//-(void)textViewDidEndEditing:(UITextView *)textView{
//
//    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
