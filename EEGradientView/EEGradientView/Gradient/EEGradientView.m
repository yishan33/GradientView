//
//  EEGradientView.m
//  EEGradientView
//
//  Created by forthonliu(刘赋山) on 2020/5/22.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "EEGradientView.h"
#import "EEGradientHelper.h"

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

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               direction:(EEGradientDirection)direction;

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               direction:(EEGradientDirection)direction
               locations:(NSArray <NSNumber *>*)locations;

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               starPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint;

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               starPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
               locations:(NSArray <NSNumber *>*)locations;

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

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               direction:(EEGradientDirection)direction
{
    [self updateWithColors:colors direction:direction locations:@[]];
}

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               direction:(EEGradientDirection)direction
               locations:(NSArray <NSNumber *>*)locations
{
    NSArray <NSValue*>*pointArray = [EEGradientHelper startEndPointsWithDirection:direction];
    [self configGradientWithColors:colors
                         starPoint:[pointArray[0] CGPointValue]
                          endPoint:[pointArray[1] CGPointValue]
                         locations:locations];
}

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               starPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
{
    [self configGradientWithColors:colors starPoint:startPoint endPoint:endPoint locations:@[]];
}

- (void)updateWithColors:(NSArray <UIColor *>*)colors
               starPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
               locations:(NSArray <NSNumber *>*)locations
{
    [self configGradientWithColors:colors starPoint:startPoint endPoint:endPoint locations:locations];
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
    CGRect bounds = CGRectIsEmpty(self.bounds) ? CGRectMake(0, 0, self.contentSize.width, self.contentSize.height) : self.bounds;
    self.textGradientLayer.frame = bounds;
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
