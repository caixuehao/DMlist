//
//  CollectionViewCell.m
//  DMlist
//
//  Created by duole on 15/9/2.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "DMCollectionViewCell.h"
#import "BaiDu.h"

@implementation DMCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"DMCollectionViewCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];

        _Label = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-25, frame.size.width, 25)];
        [_Label setTextAlignment:NSTextAlignmentCenter];
        [_Label setTextColor:[UIColor whiteColor]];
        
        _Namebg = [[UIImageView alloc] initWithFrame:_Label.frame];
        [_Namebg setBackgroundColor:[UIColor blackColor]];
        [_Namebg setAlpha:0.6];
        
        [self addSubview:_Namebg];
        [self addSubview:_Label];

        
        
    }
    return self;
}

-(void)setNameStr:(NSString*)StrName{

    _Label.text = StrName;
//    [BaiDu setFenMian:_imageview CiTiao:StrName];
    [BaiDu setFenMian3:_imageview CiTiao:StrName];
    

}
- (void)awakeFromNib {
    // Initialization code
}

@end
