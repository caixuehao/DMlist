//
//  CaiUimageView.m
//  DMlist
//
//  Created by duole on 15/9/17.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "CaiUimageView.h"

@implementation CaiUimageView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //单击事件
        UITapGestureRecognizer* DanJi = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDanJi:)];
        [self addGestureRecognizer:DanJi];
    }
    return self;
}

- (void)imageDanJi:(UITapGestureRecognizer *)sender{
    
}
@end
