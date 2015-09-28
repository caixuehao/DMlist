//
//  CAIPuliceFuntion.h
//  DMlist
//
//  Created by duole on 15/9/10.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

@interface CAIPuliceFuntion : NSObject

+(CAIPuliceFuntion*)sharedCAI;
//文本自动消失提示框
+(void)showMessage:(NSString *)message;
//下载图片到相册
-(void)DownloadImage:(NSString*)url;
//创建一个相册
-(void)addAlbum;
@end
