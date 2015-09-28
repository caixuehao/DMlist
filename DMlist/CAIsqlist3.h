//
//  sqlist3ShiYong.h
//  lss2
//
//  Created by duole on 15/8/3.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface CAIsqlist3 : NSObject{
sqlite3* db;
}

@property(nonatomic,retain)NSString* filename;//数据库的名字
@property(nonatomic,retain)NSString* filePath;//数据库的完整路径

@property(nonatomic,retain)NSMutableArray* DataArr;//数据数组

//[[CAIsqlist3 alloc] initWithFileName:@"distinct.db"];
-(id)initWithFileName:(NSString*)filename;

+(void)addData:(NSDictionary*)dic;
@end
