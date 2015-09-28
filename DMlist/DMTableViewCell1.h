//
//  DMTableViewCell1.h
//  DMlist
//
//  Created by duole on 15/8/26.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMTableViewCell1 : UITableViewCell
@property (nonatomic,strong)  UILabel *FenZu;
@property (nonatomic,strong)  UILabel *Name;
@property (nonatomic,strong)  UILabel *BeiZhu;

//-(id)initWithName:(NSString *)nameStr BeiZhu:(NSString*)beiZhu ImagePath:(NSString*)imagePath;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


-(void)setName:(NSString *)nameStr BeiZhu:(NSString*)beiZhu FenZu:(NSString*)FenZu ImagePath:(NSString*)imagePath;
@end
