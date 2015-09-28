//
//  XiangXiYingXi.h
//  DMlist
//
//  Created by duole on 15/8/27.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMCollectionViewCell.h"
@interface XiangXiYingXi : UIViewController<UIScrollViewDelegate,UITextViewDelegate>

//-(id)initWithName:(NSString*)Name BeiZhu:(NSString*)BeiZhu;

@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UITextView *BeiZhu;
@property (weak, nonatomic) IBOutlet UIButton *FanHui;
@property (weak, nonatomic) IBOutlet UIImageView *DHbg;
@property (weak, nonatomic) IBOutlet UIScrollView *FMscr;
@property (weak, nonatomic) IBOutlet UIView *DH;
@property (weak, nonatomic) IBOutlet UILabel *imageSize;
@property (weak, nonatomic) IBOutlet UIButton *setFengMian;
@property (weak, nonatomic) IBOutlet UIButton *BaoChunBeiZhu;
//@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
//@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (nonatomic, strong) DMCollectionViewCell* Rootcell;

@property (nonatomic, strong) NSMutableArray* ARR;//名字，备注，分组

@property (nonatomic, strong) NSMutableArray* imageArr;//image地址数组

@property (nonatomic, strong) NSMutableArray* imageViewArr;//imageView地址数组

@property (nonatomic, assign) int imageInt;//当前显示的图片数量

@property (nonatomic, assign) int showImageInt;//当前显示的图片索引(0开始)

@property (nonatomic, assign) float w;//屏幕宽
//-(void)setName:(NSString *)Name BeiZhu:(NSString*)BeiZhu;
@end
