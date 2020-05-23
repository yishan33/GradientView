//
//  EEGradientView.h
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EEGradientDefine.h"

NS_ASSUME_NONNULL_BEGIN

@protocol EEGradientProtocol <NSObject>

@required

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     direction:(EEGradientDirection)direction;

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     direction:(EEGradientDirection)direction
                     locations:(NSArray <NSNumber *>*)locations;

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     starPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint;

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     starPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint
                     locations:(NSArray <NSNumber *>*)locations;

@end

@interface  EEGradientView : UIView <EEGradientProtocol>

@end

@interface  EEGradientButton : UIButton <EEGradientProtocol>

@end

@interface  EEGradientImgView : UIImageView <EEGradientProtocol>

@end

@interface  EEGradientLabel : UIView <EEGradientProtocol>

@property (nonatomic, strong, readonly) UILabel *label;

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction;

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction
                    locations:(NSArray <NSNumber *>*)locations;

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint;

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint
                    locations:(NSArray <NSNumber *>*)locations;

@end

NS_ASSUME_NONNULL_END
