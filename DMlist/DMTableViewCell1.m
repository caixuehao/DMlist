//
//  DMTableViewCell1.m
//  DMlist
//
//  Created by duole on 15/8/26.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "DMTableViewCell1.h"
#import "FENZU.h"

@implementation DMTableViewCell1
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        float w = [[UIScreen mainScreen] bounds].size.width;
        self.FenZu = [[UILabel alloc] initWithFrame:CGRectMake(85, 5, 80, 35)];
        self.Name = [[UILabel alloc] initWithFrame:CGRectMake(170, 5, w-170, 35)];
        self.BeiZhu = [[UILabel alloc] initWithFrame:CGRectMake(85, 45, w-85, 30)];
        [self addSubview:self.FenZu];
        [self addSubview:self.Name];
        [self addSubview:self.BeiZhu];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setName:(NSString *)nameStr BeiZhu:(NSString *)beiZhu FenZu:(NSString*)FenZu ImagePath:(NSString *)imagePath{
    [self setBackgroundColor:[UIColor yellowColor]];
    self.Name.text = nameStr;
    self.BeiZhu.text = beiZhu;
    self.FenZu.text = [FENZU C_name:FenZu];
    self.Name.backgroundColor = [UIColor redColor];
}
@end
