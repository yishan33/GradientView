//
//  EEGradientHelper.m
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "EEGradientHelper.h"

@implementation EEGradientHelper

+ (NSArray <NSValue*>*)startEndPointsWithDirection:(EEGradientDirection)direction
{
    CGPoint startPoint;
    CGPoint endPoint;
    switch (direction) {
        case EEGradientDirectionRight:
            startPoint = CGPointZero;
            endPoint = CGPointMake(1, 0);
            break;
        case EEGradientDirectionLeft:
            startPoint = CGPointMake(1, 0);
            endPoint = CGPointMake(0, 0);
            break;
        case EEGradientDirectionUp:
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(0, 0);
            break;
        case EEGradientDirectionDown:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1);
            break;
        default:
            break;
    }
    
    return @[[NSValue valueWithCGPoint:startPoint], [NSValue valueWithCGPoint:endPoint]];
}

+ (NSArray *)gradientColorArrayWithColorArray:(NSArray *)colorArray
{
    NSMutableArray *gradientColorArray = [[NSMutableArray alloc] init];
    [colorArray enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [gradientColorArray addObject:(id)obj.CGColor];
    }];
    
    return [gradientColorArray copy];
}

@end
