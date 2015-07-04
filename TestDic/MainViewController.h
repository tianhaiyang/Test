//
//  MainViewController.h
//  TestDic
//
//  Created by 海洋 on 15/6/26.
//  Copyright (c) 2015年 www.foxconn.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (retain,nonatomic) UIButton *moreButton;
@property (retain,nonatomic) UIImageView *moreImageView;
@property (retain,nonatomic) UISegmentedControl *segment;
@property (retain,nonatomic) UITextField *textField;
@property (retain,nonatomic) UIToolbar *toolBar;
@property (retain,nonatomic) UIButton *keyboardButton;
@property (retain,nonatomic) UILabel *recentLabel;
@property (retain,nonatomic) UIImageView *recentImageView;
@property (retain,nonatomic) UIButton *recentButton;
@property (retain,nonatomic) UILabel *searchTypeLabel;
@property (retain,nonatomic) UIButton *searchButton;
@property (retain,nonatomic) UIImageView *searchPinyinImageView;
@property (retain,nonatomic) UIImageView *searchBushouImageView;

@end
