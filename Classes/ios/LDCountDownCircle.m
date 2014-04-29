//
//  LDCountDownCircle.m
//  LDCountDownCircleExemple
//
//  Created by Damien Legrand on 28/04/2014.
//  Copyright (c) 2014 Damien Legrand. All rights reserved.
//

#import "LDCountDownCircle.h"

#define LD_ADJUSTMENT 1000
#define LD_TIMER .01

@interface LDCountDownCircle () {
    NSUInteger numAdjustedSecondsCompleted;
    NSUInteger numAdjustedSecondsCompletedIncrementor;
    NSUInteger numAdjustedSecondsTotal;
    NSUInteger numSeconds;
}

@end

@implementation LDCountDownCircle

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialization];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    _strokeWidth = 1.0;
    _countDownColor = [UIColor blackColor];
}

#pragma mark - View


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    float radius = CGRectGetWidth(rect)/2.0f - _strokeWidth/2.0f;
    float angleOffset = M_PI_2;
    
    // Draw the remaining amount of timer circle.
    CGContextSetLineWidth(context, _strokeWidth);
    CGContextBeginPath(context);
    CGFloat startAngle = (_isRunning) ? (((CGFloat)numAdjustedSecondsCompleted + 1.0f) /
                                         ((CGFloat)numAdjustedSecondsTotal)*M_PI*2 - angleOffset) : 0.0;
    CGFloat endAngle = (_isRunning) ? 2*M_PI - angleOffset : 2*M_PI;
    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    startAngle,
                    endAngle,
                    0);
    
    UIColor *color = _countDownColor;
    if([self respondsToSelector:@selector(tintColor)])
    {
        color = [self tintColor];
    }
    
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokePath(context);
}


#pragma mark - Public Methods

- (void)startWithDuration:(NSTimeInterval)duration startAt:(NSTimeInterval)start
{
    if (duration < 1)
    {
        return;
    }
    
    if(start >= duration)
    {
        start = 0;
    }
    
    if (self.didStart && !self.didFinish) {
        return;
    }
    
    numSeconds = duration;
    numAdjustedSecondsCompleted = start * LD_ADJUSTMENT;
    numAdjustedSecondsCompletedIncrementor = duration;
    numAdjustedSecondsTotal = duration * LD_ADJUSTMENT;
    
    _didStart = YES;
    _didFinish = NO;
    [self resume];
}

- (void)stopCountDown
{
    [self stop];
    _didFinish = YES;
    _didStart = NO;
    [self setNeedsDisplay];
}

- (void)setCountDownColor:(UIColor *)countDownColor
{
    _countDownColor = countDownColor;
    if(![self respondsToSelector:@selector(tintColor)])
    {
        [self setNeedsDisplay];
    }
}

#pragma mark - Private Methods

- (void)stop
{
    _isRunning = NO;
    numAdjustedSecondsCompleted = 0;
}

- (void)resume
{
    if (!self.didStart || self.isRunning)
    {
        return;
    }
    
    _isRunning = YES;
    [self update];
}

- (void)update
{
    if (self.isRunning)
    {
        numAdjustedSecondsCompleted += numAdjustedSecondsTotal / (numSeconds / LD_TIMER);
        if (numAdjustedSecondsCompleted >= numAdjustedSecondsTotal)
        {
            // finished
            numAdjustedSecondsCompleted = numAdjustedSecondsTotal - 1;
            [self stop];
            _didFinish = YES;
            
            // alert delegate method that it finished
            if ([self.delegate respondsToSelector:@selector(countDownDidFinish:)])
            {
                [self.delegate countDownDidFinish:self];
            }
        }
        else
        {
            // in progress
            [NSTimer scheduledTimerWithTimeInterval:LD_TIMER
                                             target:self
                                           selector:@selector(update)
                                           userInfo:nil
                                            repeats:NO];
        }
        
        [self setNeedsDisplay];
    }
}

@end
