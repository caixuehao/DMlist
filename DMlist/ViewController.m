//
//  ViewController.m
//  DMlist
//
//  Created by duole on 15/8/26.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "ViewController.h"
#import "FENZU.h"
#import "FenZuCell.h"
#import "AddFenZuCell.h"
#import "DMTableVC.h"
#import "ZSGC.h"

@interface ViewController ()

@end
float w;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.

//设置导航栏和背景图片

    
//集合视图
     w = ([[UIScreen mainScreen] bounds].size.width-30)/2;
    _MainTable.delegate = self;
    _MainTable.dataSource = self;
    [_MainTable registerClass:[FenZuCell class] forCellWithReuseIdentifier:@"Cell"];//注册Cell
    [_MainTable registerClass:[AddFenZuCell class] forCellWithReuseIdentifier:@"AddCell"];//注册AddCell
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [FENZU C_count]+1;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义每个UICollectionView 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(w, 1.5*w);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == [FENZU C_count]){
        AddFenZuCell* cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"AddCell" forIndexPath:indexPath];
        return cell;
    }
    
    FenZuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    [cell setBackgroundColor:[UIColor yellowColor]];
    cell.Name.text = [FENZU C_name2:indexPath.row];
    cell.count.text = @"0";
    return cell;
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.row == [FENZU C_count]) {
        return;
    }
    DMTableVC *DVC = [[DMTableVC alloc] init];
    [DVC setARR:[[ZSGC ZSGC] C_FenZuAll:indexPath.row+1]];
    [self.navigationController pushViewController:DVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
