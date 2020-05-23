//
//  EEProgressView.m
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "EEProgressView.h"
#import "EEGradientView.h"

@interface EEProgressView ()

@property (nonatomic, strong) CALayer *normalLayer;

@end

@implementation EEProgressView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
}

- (void)setForeColor:(UIColor *)foreColor
{
    _foreColor = foreColor;
    self.normalLayer.backgroundColor  = foreColor.CGColor;
}




@end
