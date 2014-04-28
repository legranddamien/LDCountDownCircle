//
//  LDCountDownCircle.h
//  LDCountDownCircleExemple
//
//  Created by Damien Legrand on 28/04/2014.
//  Copyright (c) 2014 Damien Legrand. All rights reserved.
//
/**
 *  Inspired by https://github.com/johngraham262/JWGCircleCounter
 *  I wanted here to simplifie the process and be able to reuse easily the view in a table view
 */

#import <UIKit/UIKit.h>

@class LDCountDownCircle;

@protocol LDCountDownCircleDelegate <NSObject>

/**
 *  Is call when the count down arrive to 0
 *
 *  @param countDownCircle the count down which terminate
 */
- (void)countDownDidFinish:(LDCountDownCircle *)countDownCircle;

@end

/**
 *  This count down is a circle stroke with tintColor
 *  During the count the stroke will be hidden in clock direction
 */
@interface LDCountDownCircle : UIView

@property (nonatomic, weak) id<LDCountDownCircleDelegate>delegate;

/**
*  Indicates if the circle counter did start the countdown and animation.
*/
@property (nonatomic, assign, readonly) BOOL didStart;

/**
 *  Indicates if the circle counter is currently counting down and animating.
 */
@property (nonatomic, assign, readonly) BOOL isRunning;

/**
 *  Indicates if the circle counter finishing counting down and animating.
 */
@property (nonatomic, assign, readonly) BOOL didFinish;

/**
 *  The stroke width, by default the value is 1.0
 */
@property (nonatomic, assign) CGFloat strokeWidth;

/**
 *  This method will start the count down
 *
 *  @param duration the total duration of the count down
 *  @param start    where to start the count down (if the duration is 5 and start is 3 the count down will go from 2 to 0)
 */
- (void)startWithDuration:(NSTimeInterval)duration startAt:(NSTimeInterval)start;

/**
 *  This method will stop the count down and go back to the normal state
 */
- (void)stopCountDown;

@end
