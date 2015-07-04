//
//  Utility.m
//  TestDic
//
//  Created by 海洋 on 15/6/26.
//  Copyright (c) 2015年 www.foxconn.com. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(UIButton*)addButtonWithType:(UIButtonType)type andTag:(NSInteger)tag andFrame:(CGRect) frame andTitle:(NSString *)title andBackgroundImage:(UIImage *)image andFuction:(SEL)fuction andDelegate:(id)delegate andView:(UIView*)view;
{
    UIButton *button=[UIButton buttonWithType:type];
    button.frame=frame;
    button.tag=tag;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:delegate action:fuction forControlEvents:UIControlEventTouchDown];
    [view addSubview:button];
    return button;
}
+(UILabel*)addLabelWithTitle:(NSString*)title andFrame:(CGRect) frame andView:(UIView*)view
{
    UILabel *label=[[UILabel alloc] initWithFrame:frame];
    label.text=title;
    [label setBackgroundColor:[UIColor clearColor]];
    if (view!=nil) {
        [view addSubview:label];
    }
    
    return label;
}
+(UIView*)addViewWithFrame:(CGRect) frame andView:(UIView*)view
{
    UIView *aView=[[UIView alloc] initWithFrame:frame];
    if (view!=nil) {
        [view addSubview:aView];
    }
    
    return aView;
}
+(UIImageView *)addImageViewWithFrame:(CGRect)frame andImage:(UIImage *)image andView:(UIView*)view
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:frame];
    imageView.image=image;
    if (view!=nil) {
        [view addSubview:imageView];
    }
    
    return imageView;
}
+(UIToolbar *)addToolBarWithFrame:(CGRect)frame andBarStyle:(UIBarStyle)barStyle andView:(UIView *)view
{
    UIToolbar *toolbar=[[UIToolbar alloc] initWithFrame:frame];
    toolbar.barStyle=barStyle;
    if (view!=nil) {
        [view addSubview:toolbar];
    }
    
    return toolbar;
}
+(UITableView *)addTableViewWithFrame:(CGRect)frame andTableStyle:(UITableViewStyle)style andView:(UIView*)view andDelegate:(id)delegate
{
    UITableView *tableView=[[UITableView alloc] initWithFrame:frame style:style];
    tableView.dataSource=delegate;
    tableView.delegate=delegate;
    if (view!=nil) {
        [view addSubview:tableView];
    }
    
    return tableView;
}
+(UISegmentedControl*)addSegmentWithItem:(NSArray*)textArray andFrame:(CGRect)frame andStyle:(UISegmentedControlStyle)style andBgNormalImage:(UIImage*)normalImage andBgSelectedImage:(UIImage*)selectedImage andTitleTextAttributes:(NSDictionary*)titleTextAttributes andView:(UIView*)view andAction:(SEL)action andDelegate:(id)delegate
{
    UISegmentedControl *segment=[[UISegmentedControl alloc] initWithItems:textArray];
    [segment setFrame:frame];
    [segment setSegmentedControlStyle:style];
    [segment setBackgroundImage:normalImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:selectedImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segment setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    [segment setTitleTextAttributes:titleTextAttributes forState:UIControlStateSelected];
    [segment addTarget:delegate action:action forControlEvents:UIControlEventValueChanged];
    if (view!=nil) {
        [view addSubview:segment];
    }
    
    return segment;
}
+(UITextField*)addTextFieldWithFrame:(CGRect)frame andBorderStyle:(UITextBorderStyle)style andView:(UIView*)view andDelegate:(id)delegate
{
    UITextField *textField=[[UITextField alloc] initWithFrame:frame];
    [textField setBorderStyle:style];
    textField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField.delegate=delegate;
    if (view!=nil) {
        [view addSubview:textField];
    }
    
    return textField;
}

@end
