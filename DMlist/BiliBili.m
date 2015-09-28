//
//  BiliBili.m
//  DMlist
//
//  Created by duole on 15/8/29.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "BiliBili.h"
#import "AFNetworking.h"
#import "RegexKitLite.h"
#import "UIImageView+WebCache.h"

@implementation BiliBili
+(NSString*)ShouYeDaoHangLan:(UIImageView*)imageView{
    //b站背景地址所在的样式表（很可能会改变）http://static.hdslb.com/css/new_z2.css
    // 初始化网址
    NSString *requestAddress = @"http://static.hdslb.com/css/new_z2.css";
    NSString* STR= @"http://static.hdslb.com";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //默认解析成json  设置解析成nsdata
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 不带参数的GET请求
    [manager GET:requestAddress
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
           //  NSLog(@"%@", responseObject);
             //处理背景
            NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSString *regexString = @"/images/header/.*(/images/header/(.*?)\\.(png|jpg))";//获取图标
              [imageView setContentMode:UIViewContentModeScaleAspectFit];
//              NSString *regexString = @"(/images/header/(.*?)\\.(png|jpg))";//获取背景
//              [imageView setContentMode:UIViewContentModeScaleAspectFill];
//            NSLog(@"%ld",str.length);
            str = [str stringByMatching:regexString capture:1L];
             str = [STR stringByAppendingString:str] ;
             
             
             //设置图片
             [imageView sd_setImageWithURL:[[NSURL alloc] initWithString:str]];
            
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
         }];
//    NSLog(@"STR:%@", STR);
    return STR;
    
    
    //@"http://static.hdslb.com/images/header/2015_summer2_logo.png";//@"http://static.hdslb.com/images/header/2015_summer2.jpg";
}
@end
