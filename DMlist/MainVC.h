//
//  MainVC.h
//  DMlist
//
//  Created by duole on 15/8/28.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *MainTable;
@property (weak, nonatomic) IBOutlet UIImageView *BiliBiliBg;
@property (assign,nonatomic) float w;

@end
