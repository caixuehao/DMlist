//
//  FenZuCell.m
//  DMlist
//
//  Created by duole on 15/8/27.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "FenZuCell.h"
#import "FenZu.h"
#import "ZSGC.h"


@implementation FenZuCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"FenZuCell" owner:self options:nil];
        
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
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
    
}
- (void)setData:(NSInteger)FenZuInt{
    self.Name.text = [FENZU C_name2:FenZuInt];
    self.count.text = [[NSString alloc]initWithFormat:@"%ld",[[ZSGC ZSGC] C_FenZuCount:FenZuInt+1]];
    [self.Imageview setImage:[UIImage imageNamed:[FENZU C_imageName:FenZuInt]]];
}
@end
