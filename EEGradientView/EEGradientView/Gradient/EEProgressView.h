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

@property (nonatomic, assign) CGSize contentSize;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat foreMaskCornerRadius;

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction;

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction
                    locations:(NSArray <NSNumber *>*)locations;

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint;

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint
                    locations:(NSArray <NSNumber *>*)locations;

- (void)setForePureColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
