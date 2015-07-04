//
//  MyNavigationBar.h
//  TestDic
//
//  Created by 海洋 on 15/6/26.
//  Copyright (c) 2015年 www.foxconn.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigationBar : UIView


@property(retain,nonatomic)UILabel *_lablel;
@property(retain,nonatomic)UIImageView *_leftImageview;
@property(retain,nonatomic)UIImageView *_rightImageview;

-(id)initWithview:(UIView *)view;

-(void)creatNavigationBarwithTitle:(NSString *)str andLeftButton:(UIButton *)leftbutton andLeftImage:(UIImageView*)leftimageview andRightButton:(UIButton *)rightbutton andRightImage:(UIImageView*)rightimageview andView:(UIView *)view;

@end
