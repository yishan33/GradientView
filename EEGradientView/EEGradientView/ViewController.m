//
//  ViewController.m
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "ViewController.h"
#import "EEGradientView.h"
#import "EEProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testKit];
    [self testGradient];
}

- (void)testKit
{
    NSArray *colorsArray = @[UIColor.blackColor, UIColor.whiteColor];
    EEGradientLabel *bossView = [[EEGradientLabel alloc] initWithColors:colorsArray
                                                              direction:EEGradientDirectionDown];
    bossView.contentSize = CGSizeMake(180, 50);
    bossView.layer.cornerRadius = 5.0f;
    bossView.clipsToBounds = YES;
    [self.view addSubview:bossView];
        
    bossView.label.text = @"测试文案呀呀呀呀";
    bossView.label.textColor = [UIColor redColor];
    bossView.label.textAlignment = NSTextAlignmentCenter;
        
    NSArray *gradientColorsArray = @[UIColor.blueColor, UIColor.redColor];
    [bossView setTextGradientColors:gradientColorsArray direction:EEGradientDirectionRight];
    
    bossView.frame = CGRectMake(100, 100, 180, 50);
    
    [bossView updateWithColors:@[UIColor.yellowColor, UIColor.blueColor] direction:EEGradientDirectionUp];
}

- (void)testGradient
{
    EEProgressView *myProgressView = [[EEProgressView alloc] init];
    [self.view addSubview:myProgressView];
    myProgressView.backgroundColor = [UIColor grayColor];
    myProgressView.contentSize = CGSizeMake(180, 20);
    
    NSArray *textColorsArray = @[UIColor.blueColor, UIColor.redColor];
    [myProgressView setForeGradientColors:textColorsArray direction:EEGradientDirectionRight];
//    [myProgressView setForePureColor:UIColor.yellowColor];
    myProgressView.progress = 0.8;
//    myProgressView.foreMaskCornerRadius = 5;
    myProgressView.layer.cornerRadius = 5;
    myProgressView.clipsToBounds = YES;
    myProgressView.frame = CGRectMake(100, 250, 180, 20);
}

@end
