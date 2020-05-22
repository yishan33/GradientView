//
//  EEGradientHelper.h
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EEGradientDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface EEGradientHelper : NSObject

+ (NSArray <NSValue*>*)startEndPointsWithDirection:(EEGradientDirection)direction;

+ (NSArray *)gradientColorArrayWithColorArray:(NSArray *)colorArray;

@end

NS_ASSUME_NONNULL_END
