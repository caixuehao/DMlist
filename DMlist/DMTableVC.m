//
//  DMTableVC.m
//  DMlist
//
//  Created by duole on 15/9/2.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "DMTableVC.h"
#import "ZSGC.h"
#import "DMTableViewCell1.h"
#import "XiangXiXingXi.h"
#import "DMTableVC.h"
#import "BiliBili.h"
#import "DMCollectionViewCell.h"
@interface DMTableVC ()

@end

@implementation DMTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view from its nib.
    [BiliBili ShouYeDaoHangLan:_DHbg];
    
    
    [_btn setBackgroundImage:[UIImage imageNamed:@"Quiticon"] forState:UIControlStateNormal];//设置正常状态
//    [_btn setBackgroundImage:[UIImage imageNamed:@"Back02"] forState:UIControlStateSelected];//设置选择状态
    _btn.frame = CGRectMake(_btn.frame.origin.x, _btn.frame.origin.y, _btn.frame.size.height, _btn.frame.size.height);
   
    
    _btn.userInteractionEnabled = YES;
    float w = _btn2.frame.size.width;
    UIImageView* btnImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    [btnImage1 setContentMode:UIViewContentModeScaleAspectFit];
    btnImage1.frame = CGRectMake(0, 0, w, w);
    [_btn2 addSubview:btnImage1];
    UIImageView* btnImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [btnImage2 setContentMode:UIViewContentModeScaleAspectFit];
    btnImage2.frame = CGRectMake(0, 0, w, w);
    [_btn2 addSubview:btnImage2];
    //添加单击事件
    _btn2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FanZhuan)];
    [_btn2 addGestureRecognizer:tap];

    
    
    _table.delegate =self;
    _table.dataSource =self;
 
    
    _collection.delegate = self;
    _collection.dataSource = self;
    _w = ([[UIScreen mainScreen] bounds].size.width-15) / 2;
//    NSLog(@"%f",ww);
    [_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"AddDMCell"];
    [_collection registerClass:[DMCollectionViewCell class] forCellWithReuseIdentifier:@"DMCell"];//注册Cell
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 翻转
- (IBAction)FanZhuan{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [_TAB exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:self.TAB cache:YES];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [_btn2 exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:self.btn2 cache:YES];
    [UIView commitAnimations];
}
//返回
- (IBAction)FanHui:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//=====================================================================================================================
//=======================================================tableview=====================================================
//=====================================================================================================================
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _ARR.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义每个UICollectionView 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(_w, _w*1.5);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //添加单元格
    if(indexPath.row == 0){
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddDMCell" forIndexPath:indexPath];
        [cell setBackgroundColor:[UIColor yellowColor]];
    }
    //正常单元格
    DMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DMCell" forIndexPath:indexPath];
     NSArray *arr = self.ARR[indexPath.row];
    [cell setNameStr:arr[0]];
    
    return cell;
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor whiteColor];
    NSMutableArray *arr = self.ARR[indexPath.row];
    XiangXiXingXi* VC = [[XiangXiXingXi alloc] init];
    
    [VC setARR:arr];
    [VC setRootcell:(DMCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath]];
    
    [self.navigationController pushViewController:VC animated:YES];

}


//=====================================================================================================================
//=======================================================tableview=====================================================
//=====================================================================================================================
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return _ARR.count;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //享元
    DMTableViewCell1 *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    if (cell==nil) {
        cell=[[DMTableViewCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        cell = [[DMTableViewCell1 alloc]init];
    }
    
    NSArray *arr = self.ARR[indexPath.row];
    
    [cell setName:arr[0] BeiZhu:arr[1] FenZu:arr[2]  ImagePath:@"1"];
    return cell;
}

//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSMutableArray *arr = self.ARR[indexPath.row];
    XiangXiXingXi* VC = [[XiangXiXingXi alloc] init];
    
    [VC setARR:arr];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
