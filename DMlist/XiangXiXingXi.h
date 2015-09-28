//
//  XiangXiXingXi.h
//  DMlist
//
//  Created by duole on 15/9/28.
//  Copyright © 2015年 duole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMCollectionViewCell.h"

@interface XiangXiXingXi : UIViewController<UIScrollViewDelegate,UITextViewDelegate>


//视图元素
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *FengMainScrollView;
@property (weak, nonatomic) IBOutlet UIButton *SetBeiZhuBtn;
@property (weak, nonatomic) IBOutlet UILabel *imageSizeLabel;
@property (weak, nonatomic) IBOutlet UITextView *BeiZhuTextView;


//数据元素
@property (nonatomic, strong) DMCollectionViewCell* Rootcell;//点进来的单元格用于刷新单元格
@property (nonatomic, strong) NSMutableArray* ARR;//名字，备注，分组
@property (nonatomic, strong) NSMutableArray* imageArr;//image地址数组
@property (nonatomic, strong) NSMutableArray* imageViewArr;//imageView地址数组
@property (nonatomic, assign) int imageInt;//当前显示的图片数量
@property (nonatomic, assign) int showImageInt;//当前显示的图片索引(0开始)
@property (nonatomic, assign) float w;//屏幕宽


@end
