//
//  FenZu.m
//  DMlist
//
//  Created by duole on 15/8/27.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "FENZU.h"
static NSMutableDictionary* FZDIC;
@implementation FENZU
+(NSString*)C_name:(NSString*)FenZuStr{
    if (!FZDIC) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"分组名字" ofType:@"plist"];
        FZDIC = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
//           NSLog(@"%@",DIC);
        }
        NSMutableDictionary* dic =  [FZDIC objectForKey:FenZuStr];
        
        
        return [dic objectForKey:@"name"];
}

+(NSString*)C_name2:(NSInteger)FenZuInt{
    if (!FZDIC) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"分组名字" ofType:@"plist"];
        FZDIC = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        //           NSLog(@"%@",DIC);
    }
    NSString* str = [[NSString alloc] initWithFormat:@"%ld",FenZuInt+1];
    NSMutableDictionary* dic =  [FZDIC objectForKey:str];
    
    
    return [dic objectForKey:@"name"];
}

+(NSInteger)C_count{
    if (!FZDIC) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"分组名字" ofType:@"plist"];
        FZDIC = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        //           NSLog(@"%@",DIC);
    }
    return FZDIC.count;
}

+(NSString*)C_imageName:(NSInteger)FenZuInt{
    if (!FZDIC) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"分组名字" ofType:@"plist"];
        FZDIC = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        //           NSLog(@"%@",DIC);
    }
    NSString* str = [[NSString alloc] initWithFormat:@"%ld",FenZuInt+1];
    NSMutableDictionary* dic =  [FZDIC objectForKey:str];
    
    return [dic objectForKey:@"image"];
}
@end
