//
//  XiangXIXIngXI2.m
//  DMlist
//
//  Created by duole on 15/9/25.
//  Copyright © 2015年 duole. All rights reserved.
//

#import "XiangXIXIngXI2.h"
#import "MyLayout.h"
@interface XiangXIXIngXI2 ()

@end

@implementation XiangXIXIngXI2

- (void)viewDidLoad {
    [super viewDidLoad];
    //线性布局实现相对子视图
    MyLinearLayout *MainLL = [MyLinearLayout new];
    MainLL.orientation = LVORIENTATION_VERT;//垂直布局
    MainLL.padding = UIEdgeInsetsMake(0, 0, 0, 0);//边框留白
    MainLL.backgroundColor = [UIColor grayColor];
//========================================================
    MyLinearLayout *DHll = MyLinearLayout.new;
    DHll.orientation = LVORIENTATION_HORZ;
    DHll.weight = 0.1;
    DHll.leftMargin = DHll.rightMargin = 0;
    
    
    _FanHuiBtn.weight = 0.1;
    _FanHuiBtn.topMargin = _FanHuiBtn.bottomMargin = 0;
    [DHll addSubview:_FanHuiBtn];
    
    _nameLabel.weight = 0.8;
    _nameLabel.topMargin = _nameLabel.bottomMargin = 0;
    _nameLabel.leftMargin = _nameLabel.rightMargin = 5;
    [DHll addSubview:_nameLabel];
    
    _GengDuoBtn.weight = 0.1;
    _GengDuoBtn.topMargin = _GengDuoBtn.bottomMargin = 0;
    [DHll addSubview:_GengDuoBtn];
    
    [MainLL addSubview:DHll];
    
//========================================================
    _ImageScrView.weight = 0.45;
//    _ImageScrView.widthDime.equalTo(MainLL.widthDime);
    _ImageScrView.leftMargin = _ImageScrView.rightMargin = 0;
    _ImageScrView.topMargin = 20;
    [MainLL addSubview:_ImageScrView];
//========================================================
    
    MyLinearLayout *XingXi = MyLinearLayout.new;
    XingXi.orientation = LVORIENTATION_HORZ;
    XingXi.weight = 0.1;
    XingXi.leftMargin = XingXi.rightMargin = 0;
    
    
    _BaoChunBeiZhuBtn.weight = 0.25;
    _BaoChunBeiZhuBtn.topMargin = _BaoChunBeiZhuBtn.bottomMargin = 0;
    [XingXi addSubview:_BaoChunBeiZhuBtn];
    
    _setFengMianBtn.weight = 0.25;
    _setFengMianBtn.topMargin = _setFengMianBtn.bottomMargin = 0;
    _setFengMianBtn.rightMargin = _setFengMianBtn.leftMargin= 5;
    [XingXi addSubview:_setFengMianBtn];
    
    _iamageSizeLabel.weight = 0.5;
    _iamageSizeLabel.topMargin = _iamageSizeLabel.bottomMargin = 0;
    [XingXi addSubview:_iamageSizeLabel];
    

    [MainLL addSubview:XingXi];
//========================================================
    
    _BeiZhuView.weight = 0.35;
//    _BeiZhuView.widthDime.equalTo(MainLL.widthDime);
    _BeiZhuView.leftMargin = _BeiZhuView.rightMargin = 0;
    _BeiZhuView.topMargin = 20;
    [MainLL addSubview:_BeiZhuView];
    
//========================================================
    self.view = MainLL;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)返回:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
