//
//  XiaZaiMydb2.m
//  DMlist
//
//  Created by duole on 15/8/26.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "XiaZai.h"

@implementation XiaZai
//先同步的试试
+(NSString*)XiaZai1{
    
    NSString *urlAsString = @"http://121.40.68.146/Mydb2.db";
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:@"Mydb.db"];
    
    NSURL    *url = [NSURL URLWithString:urlAsString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSError *error = nil;
    
    NSData   *data = [NSURLConnection sendSynchronousRequest:request
                                           returningResponse:nil
                                                       error:&error];
    
    if (data != nil){
        
        NSLog(@"下载成功");

        if ([data writeToFile:path atomically:YES]) {
            NSLog(@"保存成功.");
        }
        else
        {
            NSLog(@"保存失败.");
        }
    } else {
        NSLog(@"%@", error);
    }
    
    return path;
}
@end

