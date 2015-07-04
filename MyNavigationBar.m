//
//  MyNavigationBar.m
//  TestDic
//
//  Created by 海洋 on 15/6/26.
//  Copyright (c) 2015年 www.foxconn.com. All rights reserved.
//

#import "MyNavigationBar.h"
#import "Utility.h"

@implementation MyNavigationBar

-(id)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    
    return self;
}

-(id)initWithview:(UIView *)view
{
    if ( self = [super init]) {
        self.frame= CGRectMake(0, 20, SCREEN_WIDTH, 44);
        
        [Utility addImageViewWithFrame:CGRectMake(0, 20, SCREEN_WIDTH+1, 44) andImage:[UIImage imageNamed:@"calligrapher@2x.png"] andView:view];
        
        self._lablel= [Utility addLabelWithTitle:nil andFrame:CGRectMake(60*SCREEN_RATE_X, 25, 200*SCREEN_RATE_X, 35) andView:view];
        
        self._lablel.textAlignment=NSTextAlignmentCenter;
        self._lablel.backgroundColor = [UIColor clearColor];
        self._lablel.textColor= [UIColor whiteColor];
        self._lablel.font = [UIFont systemFontOfSize:20.0];
        
        
    }
    return self;
}

-(void)creatNavigationBarwithTitle:(NSString *)str andLeftButton:(UIButton *)leftbutton andLeftImage:(UIImageView*)leftimageview andRightButton:(UIButton *)rightbutton andRightImage:(UIImageView*)rightimageview andView:(UIView *)view
{
    [view addSubview:leftbutton];
    [view addSubview:rightbutton];
    [view addSubview:leftimageview];
    [view addSubview:rightimageview];
    
    self._lablel.text=str;
}

@end
