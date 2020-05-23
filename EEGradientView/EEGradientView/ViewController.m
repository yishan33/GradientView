//
//  ViewController.m
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "ViewController.h"
#import "EEGradientView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testKit];
//    [self testGradient];
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
}

//- (void)testGradient
//{
//    YYChannelGradientLabel *myTestLabel = [[YYChannelGradientLabel alloc] init];
//    [self.view addSubview:myTestLabel];
//    myTestLabel.frame = CGRectMake(100, 100, 180, 50);
//    
//    myTestLabel.label.text = @"测试文案呀呀呀";
//    myTestLabel.label.textColor = [UIColor redColor];
//    myTestLabel.label.textAlignment = NSTextAlignmentCenter;
//    
//    NSArray *bgColorsArray = @[(id)UIColor.blackColor.CGColor, (id)UIColor.whiteColor.CGColor];
//    [myTestLabel setGradientColors:bgColorsArray startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
//    
//    NSArray *textColorsArray = @[(id)UIColor.blueColor.CGColor, (id)UIColor.redColor.CGColor];
//    [myTestLabel setTextGradientColors:textColorsArray startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
//}

@end
