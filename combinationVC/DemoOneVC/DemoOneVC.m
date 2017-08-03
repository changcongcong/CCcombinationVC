//
//  DemoOneVC.m
//  combinationVC
//
//  Created by admin on 2017/8/3.
//  Copyright © 2017年 常丛丛. All rights reserved.
//

#import "DemoOneVC.h"

@interface DemoOneVC ()

@end

@implementation DemoOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //显示文字方便查看显示的是第几个页面
    
    UILabel *lblShow=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    lblShow.center=self.view.center;
    lblShow.textAlignment=NSTextAlignmentCenter;
    lblShow.text=@"第一个页面";
    lblShow.textColor=[UIColor darkGrayColor];
    lblShow.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:lblShow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
