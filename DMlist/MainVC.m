//
//  MainVC.m
//  DMlist
//
//  Created by duole on 15/8/28.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "MainVC.h"
#import "FENZU.h"
#import "FenZuCell.h"
#import "AddFenZuCell.h"
#import "DMTableVC.h"
#import "ZSGC.h"
#import "BiliBili.h"
#import "AcFun.h"
#import "BaiDu.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];

    //测试
//    [BaiDu setFenMian3:nil CiTiao:@"天元突破红莲螺岩"];
//  NSLog(@"%@",[BaiDu GetFanWangZhiArr]);
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"番组网址" ofType:@"plist"];
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"1",@"123", nil];
//    [dic writeToFile:plistPath atomically:YES];
    
//        NSLog(@"%@",[BaiDu GetFanWangZhiDIC]);
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [paths objectAtIndex:0];
//    path = [path stringByAppendingString:@"/com.hackemist.SDWebImageCache.default"];
////    path = [path stringByAppendingString:@"/LaunchImages"];
//    NSFileManager * fm = [NSFileManager defaultManager];
//    NSArray * array = [fm contentsOfDirectoryAtPath:path error:nil];//获取子文件
//     path = [path stringByAppendingString:@"/"];
//    path = [path stringByAppendingString:array[0]];
//    NSLog(@"%@",array);
//    NSData* data = [NSData dataWithContentsOfFile:path];
//    NSLog(@"%@读取的内容是：%@",path,[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    //---
    // Do any additional setup after loading the view, typically from a nib.
    /*
   */
    
    //设置导航栏和背景图片
    [self.navigationController setNavigationBarHidden:YES animated:NO]; //隐藏导航栏

//    设置成b站图标
    [BiliBili ShouYeDaoHangLan:_BiliBiliBg];
    //设置成a战导航栏
//    [AcFun ACsetImageView:_BiliBiliBg];
//    [UINavigationBar appearance].backgroundColor = [UIColor yellowColor];
    // 设置导航栏背景
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"DHBg0.png"] forBarMetrics:UIBarMetricsCompact];
//    self.navigationController.navigationBar.backgroundColor = [UIImage imageNamed:@"DHBg0.png"];

    //集合视图
    _w = ([[UIScreen mainScreen] bounds].size.width-30)/2;
//    NSLog(@"%f",w);
//    w = 100;
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
    
    return CGSizeMake(_w, _w*1.5);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //添加单元格
    if(indexPath.row == [FENZU C_count]){
        AddFenZuCell* cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"AddCell" forIndexPath:indexPath];
        return cell;
    }
    //正常单元格
    FenZuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setData:indexPath.row];
    
//    [cell setBackgroundColor:[UIColor yellowColor]];
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
