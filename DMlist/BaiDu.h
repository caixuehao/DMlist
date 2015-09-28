//
//  BaiDu.h
//  DMlist
//
//  Created by duole on 15/9/7.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaiDu : NSObject


+(NSMutableDictionary*)GetFanWangZhiDIC;//查询到某个番的时候创建该番

+(void)updataDIC;//写入到plist文件中
/**
 *  设置封面
 *
 *  @param 封面视图
 *
 *  @param 词条
 *
 *  @return 返回是否成功
 */
+(BOOL)setFenMian3:(UIImageView*)imageView CiTiao:(NSString*)ciTiao;

+(void*)getImageArr:(void(^)(NSString* imageArr))Huidiao CiTiao:(NSString*)ciTiao;

/***********************************废弃函数***********************************/
+(BOOL)setFenMian2:(UIImageView*)imageView CiTiao:(NSString*)ciTiao;//只能读取第一个图片，无法加载git废弃
/**
 *  设置封面
 *
 *  @param 封面视图
 *
 *  @param 词条
 *
 *  @return 返回是否成功
 */
+(BOOL)setFenMian:(UIImageView*)imageView CiTiao:(NSString*)ciTiao;

+(NSMutableArray*)GetFanWangZhiArr;//第一次直接全部创建所有番（废弃）



@end
