//
//  FenZu.h
//  DMlist
//
//  Created by duole on 15/8/27.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FENZU : NSObject
/**
 *  查询分组号对应的分组名字
 *
 *  @param 分组号
 *
 *  @return 返回分组名
 */
+(NSString*)C_name:(NSString*)FenZuStr;
/**
 *  查询分组号对应的分组名字
 *
 *  @param 分组号
 *
 *  @return 返回分组名
 */
+(NSString*)C_name2:(NSInteger)FenZuInt;

/**
 *  查询分组个数
 *
 *  @return 返回分组个数
 */
+(NSInteger)C_count;

/**
 *  查询分组号对应的分组图片
 *
 *  @param 分组号
 *
 *  @return 返回分组名
 */
+(NSString*)C_imageName:(NSInteger)FenZuInt;
@end
