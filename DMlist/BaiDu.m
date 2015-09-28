//
//  BaiDu.m
//  DMlist
//
//  Created by duole on 15/9/7.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "BaiDu.h"
#import "AFNetworking.h"
#import "RegexKitLite.h"
#import "ZSGC.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

static NSMutableArray* ARR;
static NSMutableDictionary* DIC;
@implementation BaiDu



+(NSMutableDictionary*)GetFanWangZhiDIC{
    //先判断时否读取
    if (DIC) {
        return DIC;
    }
    //得到完整的文件名
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"番组网址.plist"];
    //读取数据
    DIC = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    //判断是否有数据（文件是否存在）
    if (!DIC){
        //写入一个数据
        DIC = [[NSMutableDictionary alloc] init];
        [DIC setObject:@"名字" forKey:@"1"];
        [BaiDu updataDIC];
    }
    
    return DIC;
}
//写入数据
+(void)updataDIC{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"番组网址.plist"];
    
    [DIC writeToFile:filename atomically:YES];
}







+(BOOL)setFenMian3:(UIImageView *)imageView CiTiao:(NSString *)ciTiao{
//    NSLog(@"词条：%@",ciTiao);
    //判断本地是否已经有封面
    NSMutableDictionary* Dic =  [[BaiDu GetFanWangZhiDIC] objectForKey:ciTiao];
    
    
    if(Dic){
        NSString * str = [Dic objectForKey:@"封面"];
        [imageView sd_setImageWithURL:[[NSURL alloc] initWithString:str] placeholderImage:[UIImage imageNamed:@"锁链背景图"]];
        
        return YES;
    }
    
    
    
    NSURL *url = [[NSURL alloc] initFileURLWithPath:ciTiao];
    NSString * requestAddress = [[NSString alloc] initWithFormat:@"http://image.baidu.com/search/index?tn=baiduimage&word=%@",[url relativeString]];
//    NSLog(@"%@",requestAddress);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //默认解析成json  设置解析成nsdata
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:requestAddress
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             
             NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             if (!str){NSLog(@"地址%@没有获取到数据",url); return;}
             
             //***********查找***********
             NSString *regexString = @"\"objURL\":\"(.*?)\"";//10
//              NSString *regexString = @"\"objURL\":\"(.*?)\"";
             NSRegularExpression * regex = [[NSRegularExpression alloc]initWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
             [regex enumerateMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                 if (result) {
                //   *stop = YES;//为空停止查找
                     //查找到的内容
                     NSString* str2 = [str substringWithRange:result.range];
                     str2 = [str2 substringWithRange:NSMakeRange(10, str2.length-11)];
                     //gif先剔除
                     if ([[str2 substringFromIndex:str2.length-3] isEqualToString:@"gif"]) {return;}
                     NSLog(@"imageURL:%@",str2);
                     
                     //设置封面
                     [imageView sd_setImageWithURL:[[NSURL alloc] initWithString:str2] placeholderImage:[UIImage imageNamed:@"锁链背景图"]];
                     *stop = YES;//停止查找
                     
                      //添加到主数组中
                     NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:str2,@"封面",nil];
                     [DIC setObject:dic forKey:ciTiao];
                   
                 }
                 
             } ];

             
             
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
         }];
    return YES;
}



+(void*)getImageArr:(void(^)(NSString* imageArr))Huidiao CiTiao:(NSString*)ciTiao{
//    NSLog(@"词条：%@",ciTiao);
    //判断本地是否已经有封面
    NSMutableDictionary* Dic =  [[BaiDu GetFanWangZhiDIC] objectForKey:ciTiao];
    NSString * nowimage = [Dic objectForKey:@"封面"];
    
    NSMutableArray *imageArr = [[NSMutableArray alloc]init];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:ciTiao];
    NSString * requestAddress = [[NSString alloc] initWithFormat:@"http://image.baidu.com/search/index?tn=baiduimage&word=%@",[url relativeString]];
//    NSLog(@"%@",requestAddress);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //默认解析成json  设置解析成nsdata
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:requestAddress
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             
             NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             if (!str){NSLog(@"地址%@没有获取到数据",url); return;}
             
             //***********查找***********
             NSString *regexString = @"\"objURL\":\"(.*?)\"";//10
             //              NSString *regexString = @"\"objURL\":\"(.*?)\"";
             NSRegularExpression * regex = [[NSRegularExpression alloc]initWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
             [regex enumerateMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                 if (result) {
                     //   *stop = YES;//为空停止查找
                     //查找到的内容
                     NSString* str2 = [str substringWithRange:result.range];
                     str2 = [str2 substringWithRange:NSMakeRange(10, str2.length-11)];
                     //gif先剔除
                     if ([[str2 substringFromIndex:str2.length-3] isEqualToString:@"gif"]) {return;}
//                     NSLog(@"imageURL:%@",str2);
                     
                     //排除当前封面
                     if ([str2 isEqualToString:nowimage]) {
                         return;
                     }
            
                     [imageArr addObject:str2];
                     Huidiao(str2);
                 }
                 
                     
                 
                 
             } ];
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
         }];
    
    
    


    return nil;
}






/***********************************废弃函数***********************************/
+(BOOL)setFenMian2:(UIImageView *)imageView CiTiao:(NSString *)ciTiao{
    NSLog(@"词条：%@",ciTiao);
    NSURL *url = [[NSURL alloc] initFileURLWithPath:ciTiao];
    ciTiao = [url relativeString];
    NSString * requestAddress = [[NSString alloc] initWithFormat:@"http://image.baidu.com/search/index?tn=baiduimage&word=%@",ciTiao];
//    NSLog(@"%@",requestAddress);

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //默认解析成json  设置解析成nsdata
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 不带参数的GET请求
    [manager GET:requestAddress
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             if (!str)return;
//             NSLog(@"%@",str);
             
//            //查找
             NSString *regexString = @"\"objURL\":\"(.*?)\"";
//             NSRegularExpression * regex = [[NSRegularExpression alloc]initWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
//             [regex enumerateMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
//                 if (!result) {
////                     *stop = YES;//为空停止查找
//                 }
//                 else{
//                     NSLog(@"%@",[str substringWithRange:result.range]);//查找到的内容
//                     str = [str substringWithRange:result.range];
//                     [imageView sd_setImageWithURL:[]]
//                      *stop = YES;
//                 }
//                 
//             } ];
            
             
             str = [str stringByMatching:regexString];
             str = [str substringWithRange:NSMakeRange(10, str.length-11)];
             if ([[str substringFromIndex:str.length-3] isEqualToString:@"gif"]) {
//                 imageView.image =  [UIImage sd_animatedGIFNamed:str];return;
             }
            [imageView sd_setImageWithURL:[[NSURL alloc] initWithString:str]];
             
            
             NSLog(@"%@",str);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
    }];
    return YES;
}

+(BOOL)setFenMian:(UIImageView *)imageView CiTiao:(NSString *)ciTiao{
    NSLog(@"词条：%@",ciTiao);
//    https://www.baidu.com/s?wd=搜索的文字
    //百度词条－》跳转到该词条的百度百科
    // 初始化网址
//    NSString *requestAddress = [[NSString alloc] initWithFormat:@"http://m.baidu.com/s?from=1099b&word=%@",ciTiao];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:ciTiao];
    ciTiao = [url relativeString];
    NSString * requestAddress = [[NSString alloc] initWithFormat:@"http://m.baidu.com/s?from=1099b&word=%@",ciTiao];
    NSLog(@"%@",requestAddress);
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //默认解析成json  设置解析成nsdata
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 不带参数的GET请求
    [manager GET:requestAddress
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             //  NSLog(@"%@", responseObject);
             
             NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             if (!str)return;
//             NSLog(@"%ld:%@",str.length,str);

             //查找拼接百科网址
             NSString *regexString = @"result_title\"\\shref=\"(.*?)_百度百科";
             str = [str stringByMatching:regexString];
             str = [str stringByMatching:@"=\"(.*?)\""];
             str = [str substringWithRange:NSMakeRange(2, str.length-3)];
             str = [@"http://m.baidu.com" stringByAppendingString:str];
             //        
             NSLog(@"%@",str);
             [BaiDu setFenMian:str];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
         }];
    

    return YES;
}
+(void)setFenMian:(NSString*)url{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //默认解析成json  设置解析成nsdata
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 不带参数的GET请求
    [manager GET:url
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSLog(@"%@",str);
             if (!str)return;
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
         }];
}



+(NSMutableArray*)GetFanWangZhiArr{
    //先判断时否读取
    if (ARR) {
        return ARR;
    }
    //再判断是否需要重新创建
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath = [paths objectAtIndex:0];
    plistPath = [plistPath stringByAppendingPathComponent:@"番组网址.plist"];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: plistPath] == NO){
        NSLog(@"%@文件不存在",plistPath);
        //同步数据库
        NSMutableArray* Arr = [[ZSGC ZSGC] C_All];
        NSMutableArray* Arr2 = [[NSMutableArray alloc] init];
        for (NSArray* arr in Arr) {
            NSDictionary* dic = [[NSDictionary alloc] initWithObjectsAndKeys:arr[0],@"名字", nil];
            [Arr2 addObject:dic];
        }
        NSMutableDictionary* DIC = [[NSMutableDictionary alloc] initWithObjectsAndKeys:Arr2,@"MainArr", nil];
        [DIC writeToFile:plistPath atomically:YES];
    }
   
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    ARR = [dic objectForKey:@"MainArr"];
    
    return ARR;
}

@end
