//
//  sqlist3ShiYong.m
//  lss2
//
//  Created by duole on 15/8/3.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "CAIsqlist3.h"

@implementation CAIsqlist3
int huidiao(void * para, int n_column, char ** column_value, char **column_name){
    
    NSDictionary* dic = [[NSDictionary alloc] init];
    int i;
    //	printf(" %S%d \n", CH("记录包含字段数"), n_column);
    for (i = 0; i < n_column; i++)
    {
        [dic setValue:[NSString stringWithUTF8String:column_value[i]] forKey:[NSString stringWithUTF8String:column_name[i]]];
    }
//    printf("%s",column_value[0]);//打印第一条
//    [self addData];
//    printf("------------------\n");
    return 0;
}
+(void)addData:(NSDictionary*)dic{

    
}

-(id)initWithFileName:(NSString*)filename{
    
   
    
    
    self = [super init];
    if (self) {
        self.filename = filename;
//         //===========================================
//     //   NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsDir =// [[NSBundle mainBundle] pathForResource:@"Icon-76" ofType:@"png"];
//        // [paths objectAtIndex:0];
//       @"/Users/duole/Desktop";
//                //这里是路径你看看怎么写
//        //===========================================
//        
//        self.filePath = [documentsDir stringByAppendingPathComponent:filename];
        NSLog(@"%@",_filePath);
        
        NSFileManager *filemgr = [NSFileManager defaultManager];
        if ([filemgr fileExistsAtPath: _filePath ] == NO){
            NSLog(@"NO");
        }
        
        
        if (sqlite3_open([[self filePath] UTF8String], &(db)) != SQLITE_OK) {
            sqlite3_close(db);
            NSAssert(0, @"数据库打开失败。");
        }
        
      NSString *sql = @"SELECT * FROM t_district";
        sqlite3_stmt *statement;
        int error =sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil);
        
         NSString *str = @"";
        
        if (error == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                char *id = (char *)sqlite3_column_text(statement, 0);
                NSString *nameStr = [[NSString alloc] initWithUTF8String:id];
                nameStr =[nameStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                
                char *dname = (char *)sqlite3_column_text(statement, 1);
                NSString *emailStr = [[NSString alloc] initWithUTF8String:dname];
//                
//                char *birthday = (char *)sqlite3_column_text(statement, 2);
//                NSString *birthdayStr = [[NSString alloc] initWithUTF8String:birthday];
                
                NSString *info = [[NSString alloc] initWithFormat:@"{\"id\":\"%@\",\"dname\":\"%@\"},",
                                  nameStr, emailStr];
                
//                NSLog(info);
                str = [str stringByAppendingString:info];
            }
            sqlite3_finalize(statement);
            NSLog(@"%@",str);
        }
   /*
        //数据库操作
        int result;
        char* errmsg = NULL;
        
        self.DataArr = [[NSMutableArray alloc] init];
        //开始查询数据库
        result = sqlite3_exec(db, "select * from H", huidiao,NULL, &errmsg);
        if (result != SQLITE_OK)
        {
            printf("SQL  erro : %s\n", errmsg);
        }
        
        
        //关闭
        if (sqlite3_close(db) != SQLITE3_TEXT)
        {
            printf("sq close YES");
        }
        else
        {
            printf("sq close NO");
        }
      
        */
    }
   
    return self;
}


@end

