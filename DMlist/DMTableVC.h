//
//  DMTableVC.h
//  DMlist
//
//  Created by duole on 15/9/2.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMTableVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIView *DH;
@property (weak, nonatomic) IBOutlet UIImageView *DHbg;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UIView *btn2;


@property (weak, nonatomic) IBOutlet UIView *TAB;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic,strong)NSMutableArray* ARR;
@property (assign,nonatomic)float  w;
@end
