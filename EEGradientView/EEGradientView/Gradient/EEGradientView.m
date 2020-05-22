//
//  EEGradientView.m
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "EEGradientView.h"
#import "EEGradientHelper.h"

static NSString * const kProgressLayer = @"kProgressLayer";

@interface UIView (Gradient)

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

@interface UIView ()

@property (setter=setYY_ProgressLayer:, getter=getYY_ProgressLayer, nonatomic, strong) CAGradientLayer *progressLayer;

@end

@implementation UIView (Gradient)

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     starPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint
                     locations:(NSArray <NSNumber *>*)locations
{
    if (self = [self initWithFrame:CGRectZero]) {
        [self configGradientWithColors:colors starPoint:startPoint endPoint:endPoint locations:locations];
    }
    
    return self;
}

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     starPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint
{
    return [self initWithColors:colors starPoint:startPoint endPoint:endPoint locations:@[]];
}

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     direction:(EEGradientDirection)direction
                     locations:(NSArray <NSNumber *>*)locations
{
    NSArray <NSValue*>*pointArray = [EEGradientHelper startEndPointsWithDirection:direction];
    return [self initWithColors:colors
                      starPoint:[pointArray[0] CGPointValue]
                       endPoint:[pointArray[1] CGPointValue]
                      locations:locations];
}

- (instancetype)initWithColors:(NSArray <UIColor *>*)colors
                     direction:(EEGradientDirection)direction
{
    return [self initWithColors:colors direction:direction locations:@[]];
}


- (void)configGradientWithColors:(NSArray <UIColor *>*)colors
                       starPoint:(CGPoint)startPoint
                        endPoint:(CGPoint)endPoint
                       locations:(NSArray <NSNumber *>*)locations
{
    if (![self.layer isKindOfClass:[CAGradientLayer class]]) {
        return;
    }
    

    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.colors = [EEGradientHelper gradientColorArrayWithColorArray:colors];
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    if (locations.count > 0) {
        layer.locations = locations;
    }
}

#pragma mark -
+ (Class)layerClass
{
    return [CAGradientLayer class];
}

//- (void)setYY_ProgressLayer:(CAGradientLayer *)progressLayer
//{
//    objc_setAssociatedObject(self, &kProgressLayer, progressLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (CAGradientLayer *)getYY_ProgressLayer
//{
//    return objc_getAssociatedObject(self, &kProgressLayer);
//}
@end

@implementation EEGradientView

@end

@interface EEGradientLabel ()
@property (nonatomic, strong, readwrite) UILabel *label;
@property (nonatomic, strong) CAGradientLayer *textGradientLayer;
@end

@implementation EEGradientLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    [self addSubview:self.label];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame = self.bounds;
}

#pragma mark -

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction
{
    [self setTextGradientColors:colors direction:direction locations:@[]];
}

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    direction:(EEGradientDirection)direction
                    locations:(NSArray <NSNumber *>*)locations
{
    NSArray <NSValue*>*pointArray = [EEGradientHelper startEndPointsWithDirection:direction];
    if (pointArray.count < 2) {
        return;
    }
    [self setTextGradientColors:colors
                      starPoint:[pointArray[0] CGPointValue]
                       endPoint:[pointArray[1] CGPointValue]
                      locations:locations];
}

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint
{
    [self setTextGradientColors:colors starPoint:startPoint endPoint:endPoint locations:@[]];
}

- (void)setTextGradientColors:(NSArray <UIColor *>*)colors
                    starPoint:(CGPoint)startPoint
                     endPoint:(CGPoint)endPoint
                    locations:(NSArray <NSNumber *>*)locations
{
    [self.layer addSublayer:self.textGradientLayer];
    self.textGradientLayer.frame = self.bounds;
    self.textGradientLayer.startPoint = startPoint;
    self.textGradientLayer.endPoint = endPoint;
    self.textGradientLayer.colors = [EEGradientHelper gradientColorArrayWithColorArray:colors];;
    if (locations.count > 0) {
        self.textGradientLayer.locations = locations;
    }
    self.textGradientLayer.mask = self.label.layer;
    self.label.frame = self.textGradientLayer.frame;
}

#pragma mark - Getter & Setter

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (CAGradientLayer *)textGradientLayer
{
    if (!_textGradientLayer) {
        _textGradientLayer = [[CAGradientLayer alloc] init];
    }
    return _textGradientLayer;
}

@end

@implementation EEGradientButton

@end

@implementation EEGradientImgView

@end
