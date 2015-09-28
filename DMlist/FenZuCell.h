//
//  FenZuCell.h
//  DMlist
//
//  Created by duole on 15/8/27.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FenZuCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UIImageView *Imageview;
@property (weak, nonatomic) IBOutlet UILabel *count;

@property (strong, nonatomic) NSArray* ARR;

- (id)initWithFrame:(CGRect)frame;

- (void)setData:(NSInteger)FenZuInt;
@end
