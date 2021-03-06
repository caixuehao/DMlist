//
//  ZSGCmydb2.h
//  DMlist
//
//  Created by duole on 15/8/26.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface ZSGC : NSObject{
    sqlite3* db;
}

    @property(nonatomic,strong)NSString* filePath;//数据库路径

    @property(nonatomic,strong)NSMutableDictionary* DIC;//分组储存的数据［分组1，分组2，分组3.......］

    +(ZSGC*)ZSGC;//返回主数据库

    -(id)init:(NSString*)filePath;

    -(NSMutableArray*)C_All;//查询全部数据［分组1［［名字，备注，分组］......］，分组2［［名字，备注，分组］......］，......］

    -(NSMutableArray*)C_FenZuAll:(NSInteger)FenZuInt;//根据分组号查询分组数据

    -(NSInteger)C_FenZuCount:(NSInteger)FenZuInt;//根据分组号查询分组元素数量




    -(BOOL)setName:(NSString*)newname BeiZhu:(NSString*)beizhu FenZu:(NSString*)fenzu oldName:(NSString*)oldname;//修改

    -(BOOL)setBeiZhu:(NSString*)beizhu Name:(NSString*)name;//设置备注
@end
