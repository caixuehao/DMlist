//
//  ZSGCmydb2.m
//  DMlist
//
//  Created by duole on 15/8/26.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "ZSGC.h"
#import "XiaZai.h"

static ZSGC* mydb;

@implementation ZSGC

+(ZSGC*)ZSGC{
    if (mydb) {
        return mydb;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:@"Mydb.db"];
    
    mydb = [[ZSGC alloc] init:path];
    
    return mydb;
}

-(id)init:(NSString*)filePath{
    self = [super init];
    if (self)
    {
        self.filePath = filePath;
        [self C_All];
    }
    return self;
}

//查询全部
-(NSMutableArray*)C_All{
    
    _DIC = [[NSMutableDictionary alloc] init];
    
    NSMutableArray* ARR = [[NSMutableArray alloc] init];
    //判断路径是否正确
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _filePath] == NO){
        NSLog(@"%@文件不存在",_filePath);
        [XiaZai XiaZai1];//同步下载 数据库
    }
    //判断数据库是否打开成功
    if (sqlite3_open([_filePath UTF8String], &(db)) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0, @"数据库打开失败。");
    }
    //开始查询
    NSString *sql = @"SELECT * FROM H";
    sqlite3_stmt *statement;
    int error =sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil);

    if (error == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            char *id = (char *)sqlite3_column_text(statement, 0);
            NSString *nameStr = [[NSString alloc] initWithUTF8String:id];
            nameStr =[nameStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            char *beiZhu = (char *)sqlite3_column_text(statement, 1);
            NSString *beiZhuStr = [[NSString alloc] initWithUTF8String:beiZhu];
            
            
            char *fenZu = (char *)sqlite3_column_text(statement, 2);
            NSString *fenZuStr = [[NSString alloc] initWithUTF8String:fenZu];
            
        
            NSArray* arr = @[nameStr,beiZhuStr,fenZuStr];
            
            NSMutableArray* Arr = [_DIC valueForKey:fenZuStr];
            if (!Arr) {
                Arr = [[NSMutableArray alloc] init];
                [_DIC setObject:Arr forKey:fenZuStr];
            }
            
            [Arr addObject:arr];
//            NSLog(@"名字：%@，备注：%@，分组：%ld。",nameStr,beiZhuStr,fenZuInt);
            [ARR addObject:arr];
            
        }
        sqlite3_finalize(statement);
       
    }else{
        NSLog(@"查询失败");
    }

    return ARR;
}

-(NSMutableArray*)C_FenZuAll:(NSInteger)FenZuInt;//根据分组号查询分组数据
{
    return [_DIC valueForKey:[[NSString alloc]initWithFormat:@"%ld",FenZuInt]];
}

-(NSInteger)C_FenZuCount:(NSInteger)FenZuInt
{
    return [self C_FenZuAll:FenZuInt].count;
}

-(BOOL)setName:(NSString *)newname BeiZhu:(NSString *)beizhu FenZu:(NSString *)fenzu oldName:(NSString *)oldname{

    NSString *sql = [[NSString alloc]initWithFormat:@"UPDATE H SET name = '%@' , beizhu = '%@' ,fenzu = '%@' WHERE name = '%@'",newname,beizhu,fenzu,oldname];
    sqlite3_stmt *statement;
    int error = sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil);
    NSLog(@"%d",error);
    if (sqlite3_step(statement) == SQLITE_DONE){
        //这里可以更改优化
        [self C_All];
        
        return YES;
    }
   
    
    return NO;
}

-(BOOL)setBeiZhu:(NSString *)beizhu Name:(NSString *)name{
//    NSString *sql = [[NSString alloc]initWithFormat:@"UPDATE H SET beizhu = ? ,name = ? ,fenzu = ? WHERE name = ?"];
    return YES;
}
@end
