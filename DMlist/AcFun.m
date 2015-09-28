//
//  AcFun.m
//  DMlist
//
//  Created by duole on 15/8/30.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "AcFun.h"
#import "AFNetworking.h"
#import "RegexKitLite.h"
#import "UIImageView+WebCache.h"


@implementation AcFun

+(void)ACsetImageView:(UIImageView *)imageview{
    // 初始化网址
    NSString *requestAddress = @"http://www.acfun.tv";
    
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
             if (!str)return;
             NSString *regexString = @"background.*url\\((.*?)\\)";
             NSLog(@"%ld",str.length);
             NSLog(@"%@",str);
             str = [str stringByMatching:regexString capture:1L];
             if (!str)return;
             
             NSLog(@"%@",str);
             //设置图片
             [imageview sd_setImageWithURL:[[NSURL alloc] initWithString:str]];
             
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
         }];


}

@end
