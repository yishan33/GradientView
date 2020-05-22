//
//  EEProgressView.h
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EEGradientView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EEProgressView : UIView

@property (nonatomic, strong) EEGradientView *foreGradientView;
@property (nonatomic, assign) CGSize contentSize;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) UIColor *foreColor;

@end

NS_ASSUME_NONNULL_END
