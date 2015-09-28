//
//  CAIPuliceFuntion.m
//  DMlist
//
//  Created by duole on 15/9/10.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "CAIPuliceFuntion.h"
#import "UIImageView+WebCache.h"



static CAIPuliceFuntion* CAIpt;
@implementation CAIPuliceFuntion
+(CAIPuliceFuntion*)sharedCAI{
    if (!CAIpt)     CAIpt = [[CAIPuliceFuntion alloc] init];
    return CAIpt;
}
//888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
+(void)showMessage:(NSString *)message
{
    
    int w = [[UIScreen mainScreen] bounds].size.width;
    int h = [[UIScreen mainScreen] bounds].size.height;
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [showview addSubview:label];
    showview.frame = CGRectMake((w - LabelSize.width - 20)/2, h - 100, LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:1.5 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}
//888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-(void)DownloadImage:(NSString *)url{
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[[NSURL alloc]initWithString:url] options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        NSLog(@"%ld %ld",(long)receivedSize,(long)expectedSize);
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        if(error){
            [CAIPuliceFuntion showMessage:@"保存失败"];return;
        }
        else{
            [CAIPuliceFuntion showMessage:@"保存成功"];
        }
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)(^(NSURL* assetURL, NSError* error) {
            if (error!=nil) {
                return;
            }
        }));
        
    }];
}

//保存结束回调
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo{
  
}


//888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
-(void)addAlbum{
   
    
//    http://www.itstrike.cn/Question/2ad0e65d-b949-4c7b-8e76-00690aa3d9a7.html
//    http://www.iashes.com/2015-03-544.html
/*
     ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    //获取权限成功之后该干的事
    ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop)
    {

                [assetsLibrary addAssetsGroupAlbumWithName:@"动漫3"
                                               resultBlock:^(ALAssetsGroup *group)
                 {

                    [self showMessage:@"创建相册成功"];
                     
                 }
                failureBlock:^(NSError* error){
                    [self showMessage:@"创建相册失败"];
                            
                }];
  
    };
    //创建相簿
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupLibrary usingBlock:listGroupBlock failureBlock:^(NSError* error){
         [self showMessage:@"创建相册失败,没有权限"];
    }];
*/

}
//888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
@end
