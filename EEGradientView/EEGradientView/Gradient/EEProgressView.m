//
//  EEProgressView.m
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "EEProgressView.h"
#import "EEGradientView.h"
#import "EEGradientHelper.h"

typedef NS_ENUM(NSUInteger, EEProgressViewType) {
    EEProgressViewTypePure,
    EEProgressViewTypeGradient
};

@interface EEProgressView ()

@property (nonatomic, strong) UIView *foreMaskView;

@property (nonatomic, strong) UIView *forePureView;
@property (nonatomic, strong) EEGradientView *foreGradientView;

@property (nonatomic, assign) EEProgressViewType progressType;

@end

@implementation EEProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    [self addSubview:self.forePureView];
    [self addSubview:self.foreGradientView];
    [self addSubview:self.foreMaskView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _foreGradientView.frame = self.bounds;
    _forePureView.frame = self.bounds;
}

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction
{
    [self setForeGradientColors:colors direction:direction locations:@[]];
}

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction
                    locations:(NSArray <NSNumber *>*)locations
{
    NSArray <NSValue*>*pointArray = [EEGradientHelper startEndPointsWithDirection:direction];
    if (pointArray.count < 2) {
        return;
    }
    [self setForeGradientColors:colors
                      starPoint:[pointArray[0] CGPointValue]
                       endPoint:[pointArray[1] CGPointValue]
                      locations:locations];
}

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint
{
    [self setForeGradientColors:colors starPoint:startPoint endPoint:endPoint locations:@[]];
}

- (void)setForeGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint
                    locations:(NSArray <NSNumber *>*)locations
{
    [self.foreGradientView updateWithColors:colors starPoint:startPoint endPoint:endPoint locations:locations];
    self.progressType = EEProgressViewTypeGradient;
}

- (void)setForePureColor:(UIColor *)color
{
    self.forePureView.backgroundColor = color;
    self.progressType = EEProgressViewTypePure;
}

- (void)setProgressType:(EEProgressViewType)progressType
{
    _progressType = progressType;
    switch (progressType) {
        case EEProgressViewTypePure: {
            self.foreGradientView.hidden = YES;
            self.forePureView.hidden = NO;
            self.forePureView.maskView = self.foreMaskView;
            break;
        }
        case EEProgressViewTypeGradient: {
            self.forePureView.hidden = YES;
            self.foreGradientView.hidden = NO;
            self.foreGradientView.maskView = self.foreMaskView;
            break;
        }
        default:
            break;
    }
}

#pragma mark -

- (void)setProgress:(CGFloat)progress
{
    _progress = MAX(0, MIN(1.0f, progress));
    CGRect bounds = CGRectMake(0, 0, self.bounds.size.width * _progress, self.bounds.size.height);
    if (CGRectIsEmpty(self.bounds)) {
        bounds = CGRectMake(0, 0, self.contentSize.width * _progress, self.contentSize.height);
    }
    
    self.foreMaskView.frame = bounds;
}

- (void)setForeMaskCornerRadius:(CGFloat)foreMaskCornerRadius
{
    self.foreMaskView.layer.cornerRadius = foreMaskCornerRadius;
}

- (UIView *)foreMaskView
{
    if (!_foreMaskView) {
        _foreMaskView = [[UIView alloc] init];
        _foreMaskView.backgroundColor = [UIColor whiteColor];
    }
    return _foreMaskView;
}

- (UIView *)forePureView
{
    if (!_forePureView) {
        _forePureView = [[UIView alloc] init];
    }
    return _forePureView;
}

- (EEGradientView *)foreGradientView
{
    if (!_foreGradientView) {
        _foreGradientView = [[EEGradientView alloc] init];
    }
    return _foreGradientView;
}

@end
