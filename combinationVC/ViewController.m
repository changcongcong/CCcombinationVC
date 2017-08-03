//
//  ViewController.m
//  combinationVC
//
//  Created by admin on 2017/8/3.
//  Copyright © 2017年 常丛丛. All rights reserved.
//

#define kScaleSize(sizew) [UIScreen mainScreen].bounds.size.width*sizew/320

#import "ViewController.h"
#import "DemoOneVC.h"
#import "DemoTwoVC.h"

@interface ViewController (){
    UIView *contentView;
    DemoOneVC *vc1;
    DemoTwoVC *vc2;
    UIViewController* currentVC;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //放置两个按钮切换页面
    UIButton *btnSelectOneVC=[[UIButton alloc]initWithFrame:CGRectMake(kScaleSize(60), kScaleSize(30), kScaleSize(80), kScaleSize(30))];
    btnSelectOneVC.layer.borderWidth=1;
    btnSelectOneVC.layer.borderColor=[UIColor darkGrayColor].CGColor;
    btnSelectOneVC.layer.masksToBounds=YES;
    [btnSelectOneVC addTarget:self action:@selector(btnSelectOneVC_Click) forControlEvents:UIControlEventTouchUpInside];
    btnSelectOneVC.layer.cornerRadius=kScaleSize(5);
    [btnSelectOneVC setTitle:@"切换第一个页面" forState:UIControlStateNormal];
    [btnSelectOneVC setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    btnSelectOneVC.titleLabel.font=[UIFont systemFontOfSize:11];
    [self.view addSubview:btnSelectOneVC];
    
    UIButton *btnSelectTwoVC=[[UIButton alloc]initWithFrame:CGRectMake(kScaleSize(180), kScaleSize(30), kScaleSize(80), kScaleSize(30))];
    btnSelectTwoVC.layer.borderWidth=1;
    btnSelectTwoVC.layer.borderColor=[UIColor darkGrayColor].CGColor;
    btnSelectTwoVC.layer.masksToBounds=YES;
    btnSelectTwoVC.layer.cornerRadius=kScaleSize(5);
    [btnSelectTwoVC addTarget:self action:@selector(btnSelectTwoVC_Click) forControlEvents:UIControlEventTouchUpInside];
    [btnSelectTwoVC setTitle:@"切换第二个页面" forState:UIControlStateNormal];
    [btnSelectTwoVC setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    btnSelectTwoVC.titleLabel.font=[UIFont systemFontOfSize:11];
    [self.view addSubview:btnSelectTwoVC];
    
    //加个view，放置别的页面的view
    contentView = [[UIView alloc]initWithFrame:CGRectMake(0, kScaleSize(70), kScaleSize(320), [UIScreen mainScreen].bounds.size.height-kScaleSize(70))];
    [self.view addSubview:contentView];
    
    //添加子页面
    [self addSubControllers];
}

#pragma mark - privatemethods
- (void)addSubControllers
{
    vc1 = [[DemoOneVC alloc] init];
    //将vc1加入到当前页面的子页面
    [self addChildViewController:vc1];
    
    vc2 = [[DemoTwoVC alloc] init];
    //将vc2加入到当前页面的子页面
    [self addChildViewController:vc2];
    
    //调整子视图控制器的Frame已适应容器View
    [self fitFrameForChildViewController:vc2];
    //设置默认显示在容器View的内容
    [contentView addSubview:vc2.view];
    currentVC = vc2;
}

- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

//切换到第一个页面
-(void)btnSelectOneVC_Click{
    if (currentVC == vc1) {
        return ;
    }
    [self fitFrameForChildViewController:vc1];
    [self transitionFromOldViewController:currentVC toNewViewController:vc1];
}

//切换到第二个页面
-(void)btnSelectTwoVC_Click{
    if (currentVC == vc2) {
        return ;
    }
    
    [self fitFrameForChildViewController:vc2];
    [self transitionFromOldViewController:currentVC toNewViewController:vc2];
}

//转换子视图控制器
- (void)transitionFromOldViewController:(UIViewController *)oldViewController toNewViewController:(UIViewController *)newViewController{
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            currentVC = (UIViewController*)newViewController;
        }else{
            currentVC = (UIViewController*)oldViewController;
        }
    }];
}

@end
