//
//  Utility.h
//  TestDic
//
//  Created by 海洋 on 15/6/26.
//  Copyright (c) 2015年 www.foxconn.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

+(UIButton*)addButtonWithType:(UIButtonType)type andTag:(NSInteger)tag andFrame:(CGRect) frame andTitle:(NSString *)title andBackgroundImage:(UIImage *)image andFuction:(SEL)fuction andDelegate:(id)delegate andView:(UIView*)view;
+(UILabel*)addLabelWithTitle:(NSString*)title andFrame:(CGRect) frame andView:(UIView*)view;
+(UIView*)addViewWithFrame:(CGRect) frame andView:(UIView*)view;
+(UIImageView *)addImageViewWithFrame:(CGRect)frame andImage:(UIImage *)image andView:(UIView*)view;
+(UIToolbar *)addToolBarWithFrame:(CGRect)frame andBarStyle:(UIBarStyle)barStyle andView:(UIView*)view;
+(UITableView *)addTableViewWithFrame:(CGRect)frame andTableStyle:(UITableViewStyle)style andView:(UIView*)view andDelegate:(id)delegate;
+(UISegmentedControl*)addSegmentWithItem:(NSArray*)textArray andFrame:(CGRect)frame andStyle:(UISegmentedControlStyle)style andBgNormalImage:(UIImage*)normalImage andBgSelectedImage:(UIImage*)selectedImage andTitleTextAttributes:(NSDictionary*)titleTextAttributes andView:(UIView*)view andAction:(SEL)action andDelegate:(id)delegate;
+(UITextField*)addTextFieldWithFrame:(CGRect)frame andBorderStyle:(UITextBorderStyle)style andView:(UIView*)view andDelegate:(id)delegate;

@end
