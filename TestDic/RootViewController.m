//
//  RootViewController.m
//  TestDic
//
//  Created by 海洋 on 15/6/25.
//  Copyright (c) 2015年 www.foxconn.com. All rights reserved.
//

#import "Utility.h"
#import "RootViewController.h"
#import "MainViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    UILabel *_progressLable;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Utility addImageViewWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) andImage:[UIImage imageNamed:@"startup-interface@2x.png"] andView:self.view];
    
    self.progressBar=[[KOAProgressBar alloc] initWithFrame:CGRectMake(10*SCREEN_RATE_X, SCREEN_HEIGHT-110*SCREEN_RATE_Y, SCREEN_WIDTH-20*SCREEN_RATE_X,15*SCREEN_RATE_Y)];
    [self.progressBar setMinValue:0.0];
    [self.progressBar setMaxValue:1.0];
    [self.progressBar setRealProgress:0.25];
    [self.progressBar setDisplayedWhenStopped:YES];
    [self.progressBar setAnimationDuration:2.0];
    [self.progressBar startAnimation:self];
    [self.view addSubview:self.progressBar];
    
    _progressLable=[Utility addLabelWithTitle:nil andFrame:CGRectMake(SCREEN_WIDTH/2-18*SCREEN_RATE_X, SCREEN_HEIGHT-150*SCREEN_RATE_Y, 100*SCREEN_RATE_X, 30*SCREEN_RATE_Y) andView:self.view];
    _progressLable.textColor=[UIColor whiteColor];
    _progressLable.backgroundColor=[UIColor clearColor];
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(changeTime:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view from its nib.
}
-(void)changeTime:(NSTimer *)time
{
    _progressLable.text=[NSString stringWithFormat:@"%.f%%",(self.progressBar.progress/1.0)*100];
    if (self.progressBar.progress==1.0) {
                NSLog(@"start");
        MainViewController *main_C=[[MainViewController alloc] init];
        UINavigationController *nav_C=[[UINavigationController alloc] initWithRootViewController:main_C];
        nav_C.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav_C animated:YES completion:nil];
        [time invalidate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
