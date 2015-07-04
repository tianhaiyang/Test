//
//  MainViewController.m
//  TestDic
//
//  Created by 海洋 on 15/6/26.
//  Copyright (c) 2015年 www.foxconn.com. All rights reserved.
//

#import "MainViewController.h"
#import "MyNavigationBar.h"
#import "Utility.h"
#import "Zuijin.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //隐藏View 自带的navigationBar
    self.navigationController.navigationBarHidden=YES;
    
    
    MyNavigationBar *myNavigationBar = [[MyNavigationBar alloc]initWithview:self.view];
    
    self.moreButton = [Utility addButtonWithType:UIButtonTypeCustom andTag:100 andFrame:CGRectMake(280*SCREEN_RATE_X, 20, 40*SCREEN_RATE_X, 44) andTitle:nil andBackgroundImage:nil andFuction:@selector(doMore:) andDelegate:self andView:nil];
    
    [self.moreButton setBackgroundImage:[UIImage imageNamed:@"concave.png"] forState:UIControlStateHighlighted];
    
    self.moreImageView = [Utility addImageViewWithFrame:CGRectMake(290*SCREEN_RATE_X, 20+19, 20*SCREEN_RATE_X, 5) andImage:[UIImage imageNamed:@"more.png"] andView:nil];
    
    [myNavigationBar creatNavigationBarwithTitle:@"汉词词典" andLeftButton:nil andLeftImage:nil andRightButton:_moreButton andRightImage:_moreImageView andView:self.view];
    
    
    //segment显示文字
    NSArray *segArray=@[@"拼音检字",@"部首检字"];
    //segment字体颜色和大小 [UIColor blackColor],
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,[UIFont fontWithName:@"AppleGothic" size:14],UITextAttributeFont, nil];


    //创建segment
    self.segment=[Utility addSegmentWithItem:segArray andFrame:CGRectMake(20*SCREEN_RATE_X, 74*SCREEN_RATE_X, 280*SCREEN_RATE_X, 30*SCREEN_RATE_X) andStyle:UISegmentedControlStyleBar andBgNormalImage:[UIImage imageNamed:@"pyjz_normal01.png"] andBgSelectedImage: [UIImage imageNamed:@"pyjz_pressed11.png"] andTitleTextAttributes:dic andView:self.view andAction:@selector(doChangeJz:) andDelegate:self];
    
    //默认选中拼音检字
    self.segment.selectedSegmentIndex=0;
    
    //创建textField
    self.textField=[Utility addTextFieldWithFrame:CGRectMake(20*SCREEN_RATE_X, 114*SCREEN_RATE_Y, 280*SCREEN_RATE_X, 30*SCREEN_RATE_Y) andBorderStyle:UITextBorderStyleRoundedRect andView:self.view andDelegate:self];
    //设置默认文字
    [self.textField setPlaceholder:@"请输入..."];
    //设置return键类型
    [self.textField setReturnKeyType:UIReturnKeySearch];
    
    //设置键盘附件视图
    self.toolBar=[Utility addToolBarWithFrame:CGRectMake(0, 80*SCREEN_RATE_Y, 320*SCREEN_RATE_X, 40*SCREEN_RATE_Y) andBarStyle:UIBarStyleBlackTranslucent andView:nil];
    self.textField.inputAccessoryView=self.toolBar;
    self.keyboardButton=[Utility addButtonWithType:UIButtonTypeCustom andTag:100 andFrame:CGRectMake(290*SCREEN_RATE_X, 5*SCREEN_RATE_Y, 23*SCREEN_RATE_X, 23*SCREEN_RATE_Y) andTitle:nil andBackgroundImage:[UIImage imageNamed:@"jianpan.png"] andFuction:@selector(doKeyboardButton:) andDelegate:self andView:self.toolBar];
    
    //创建最近搜索label
    self.recentLabel=[Utility addLabelWithTitle:@"最近搜索:" andFrame:CGRectMake(20*SCREEN_RATE_X, 154*SCREEN_RATE_Y, 100*SCREEN_RATE_X, 30*SCREEN_RATE_Y) andView:self.view];
    [self.recentLabel setTextColor:[UIColor colorWithRed:120.0/255 green:39.0/255 blue:15.0/255 alpha:1]];
    
    //创建分割线
    [Utility addImageViewWithFrame:CGRectMake(20*SCREEN_RATE_X, 187*SCREEN_RATE_Y, 280*SCREEN_RATE_X, 2*SCREEN_RATE_Y) andImage:[UIImage imageNamed:@"pinyin.png"] andView:self.view];
    
    //创建搜索类型label
    self.searchTypeLabel=[Utility addLabelWithTitle:@"按照拼音字母检索:" andFrame:CGRectMake(20*SCREEN_RATE_X, 227*SCREEN_RATE_Y, 280*SCREEN_RATE_X, 30*SCREEN_RATE_Y) andView:self.view];
    [self.searchTypeLabel setTextColor:[UIColor colorWithRed:120.0/255 green:39.0/255 blue:15.0/255 alpha:1]];
    
    //创建分割线
    [Utility addImageViewWithFrame:CGRectMake(20*SCREEN_RATE_X, 260*SCREEN_RATE_Y, 280*SCREEN_RATE_X, 2*SCREEN_RATE_Y) andImage:[UIImage imageNamed:@"pinyin.png"] andView:self.view];
    
    NSArray *pinyinArray=@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSArray *bushouArray=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"];

    
    //创建部首检索索引视图
    self.searchBushouImageView= [Utility addImageViewWithFrame:CGRectMake(20*SCREEN_RATE_X, 272*SCREEN_RATE_Y, 280*SCREEN_RATE_X, 180*SCREEN_RATE_Y) andImage:[UIImage imageNamed:@"Key-frame2.png"] andView:self.view];
    [self.searchBushouImageView setUserInteractionEnabled:YES];
    int count=0;
    for (int i=0; i<3; i++) {
        for (int j=0; j<6; j++) {
            count++;
            self.searchButton=[Utility addButtonWithType:UIButtonTypeCustom andTag:count andFrame:CGRectMake((5+j*48)*SCREEN_RATE_X, (5+i*50)*SCREEN_RATE_Y, 24*SCREEN_RATE_X, 25*SCREEN_RATE_Y) andTitle:[bushouArray objectAtIndex:count-1]  andBackgroundImage:nil andFuction:@selector(doBushouSearch:) andDelegate:self andView:self.searchBushouImageView];
            [self.searchButton setTitleColor:[UIColor colorWithRed:130.0/255 green:32.0/255 blue:10.0/255 alpha:1] forState:UIControlStateNormal];
            [self.searchButton setBackgroundImage:[UIImage imageNamed:@"pressed1.png"] forState:UIControlStateHighlighted];
            if (count>=17) {
                break;
            }
        }
        
    }
    
    //创建拼音检索索引视图
    self.searchPinyinImageView= [Utility addImageViewWithFrame:CGRectMake(20*SCREEN_RATE_X, 272*SCREEN_RATE_Y, 280*SCREEN_RATE_X, 180*SCREEN_RATE_Y) andImage:[UIImage imageNamed:@"Key-frame2.png"] andView:self.view];
    [self.searchPinyinImageView setUserInteractionEnabled:YES];
    count=0;
    for (int i=0; i<4; i++) {
        for (int j=0; j<8; j++) {
            count++;
            self.searchButton=[Utility addButtonWithType:UIButtonTypeCustom andTag:count andFrame:CGRectMake((5+j*36)*SCREEN_RATE_X, (5+i*50)*SCREEN_RATE_Y, 18*SCREEN_RATE_X, 25*SCREEN_RATE_Y) andTitle:[pinyinArray objectAtIndex:count-1]  andBackgroundImage:nil andFuction:@selector(doPinyinSearch:) andDelegate:self andView:self.searchPinyinImageView];
            [self.searchButton setTitleColor:[UIColor colorWithRed:130.0/255 green:32.0/255 blue:10.0/255 alpha:1] forState:UIControlStateNormal];
            [self.searchButton setBackgroundImage:[UIImage imageNamed:@"pressed1.png"] forState:UIControlStateHighlighted];
            if (count>=26) {
                break;
            }
        }
        
    }
    [self.searchBushouImageView setHidden:YES];
}



-(void)doMore:(UIButton *)btn
{
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [self addSearchTextButton];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.recentImageView removeFromSuperview];
}
//点击segment触发的方法
-(void)doChangeJz:(UISegmentedControl *)segment
{
    if (segment.selectedSegmentIndex==0) {
        self.searchTypeLabel.text=@"按照拼音字母检索:";
        [self.searchPinyinImageView setHidden:NO];
        [self.searchBushouImageView setHidden:YES];
    }
    else
    {
        self.searchTypeLabel.text=@"按照部首笔画检索:";
        [self.searchPinyinImageView setHidden:YES];
        [self.searchBushouImageView setHidden:NO];
    }
}

-(void)doKeyboardButton:(UIButton *)btn
{
    [self.textField resignFirstResponder];
}

-(void)doRecent:(UIButton*)btn
{
//    DetailViewController *detail_C=[[DetailViewController alloc]init];
//    detail_C.titletext=btn.titleLabel.text;
//    [self.navigationController pushViewController:detail_C animated:YES];
}


//创建最近搜索显示的内容(i<=count,count是最近搜索表中的数据count)
-(void)addSearchTextButton
{
    //创建最近搜索的显示View
    self.recentImageView=[Utility addImageViewWithFrame:CGRectMake(20, 54+110+5+8, 280, 30) andImage:[UIImage imageNamed:@"Key-frame1.png"] andView:self.view];
    [self.recentImageView setUserInteractionEnabled:YES];

    UILongPressGestureRecognizer *longGesture=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(doDeleteRecent:)];


    NSMutableArray *recentArray=[Zuijin selectAllZuijin];
    if ([recentArray count]!=0) {
        for (int i=1; i<=[recentArray count]; i++) {
            Zuijin *zuijin=[recentArray objectAtIndex:i-1];
            self.recentButton=[Utility addButtonWithType:UIButtonTypeCustom andTag:i andFrame:CGRectMake(5+(i-1)*36, 6, 18, 18) andTitle:zuijin.hanzi andBackgroundImage:nil andFuction:@selector(doRecent:) andDelegate:self andView:self.recentImageView];
            [self.recentButton setTitleColor:[UIColor colorWithRed:120.0/255 green:39.0/255 blue:15.0/255 alpha:1] forState:UIControlStateNormal];
            [self.recentButton setBackgroundImage:[UIImage imageNamed:@"pressed1.png"] forState:UIControlStateHighlighted];
        }
    }


}


//长按手势触发方法
-(void)doDeleteRecent:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state==UIGestureRecognizerStateBegan) {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"删除最近搜索" message:@"确定要删除吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    
}

//alertView代理方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            
            break;
        case 1:
//            if ([Zuijin deleteAllZuijin])//删除所有最近搜索
//            {
//                [self.recentImageView removeFromSuperview];
//                //[self addSearchTextButton];
//            }
            
            break;
            
        default:
            break;
    }
}
//点击拼音检索
-(void)doPinyinSearch:(UIButton *)btn
{
    //    NSLog(@"pinyin=%@",btn.titleLabel.text);
//    PinyinSearchViewController *pinYinSearch_C=[[PinyinSearchViewController alloc] init];
//    pinYinSearch_C.buttonTag=btn.tag;
//    [self.navigationController pushViewController:pinYinSearch_C animated:YES];
}
//点击部首检索
-(void)doBushouSearch:(UIButton *)btn
{
//    BushouSearchViewController *bushouSearch_C=[[BushouSearchViewController alloc] init];
//    bushouSearch_C.buttonTag=btn.tag;
//    [self.navigationController pushViewController:bushouSearch_C animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
