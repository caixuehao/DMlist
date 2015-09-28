//
//  CeShi.m
//  DMlist
//
//  Created by duole on 15/8/30.
//  Copyright (c) 2015年 duole. All rights reserved.
//

#import "CeShi.h"
#import "RegexKitLite.h"
@interface CeShi ()

@end

@implementation CeShi

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn:(id)sender{
    
    NSString* str =  [self.YSstring.text stringByMatching:self.tiaojian.text capture:1L];
    NSLog(@"str:%@",str);
    self.CLZHDstring.text = str;
    
//  NSArray *matchArray =  [self.YSstring.text componentsSeparatedByString:self.tiaojian.text];
//    NSLog(@"%@",matchArray);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
