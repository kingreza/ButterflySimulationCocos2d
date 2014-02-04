//
//  Butterfly.h
//  ButterflyAnimation
//
//  Created by Reza Shirazian on 2/3/2014.
//  Copyright 2014 Reza Shirazian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Butterfly : CCNode

@property  (nonatomic, assign) CCSprite *RightWing;
@property (nonatomic, assign) CCSprite *LeftWing;

@property (nonatomic, assign) CGPoint ControlPoint1;
@property (nonatomic, assign) CGPoint ControlPoint2;
@property (nonatomic, assign) CGPoint EndPosition;
@property (readonly) BOOL isInFlight;
@property (readwrite) float wingShutter;
@property (readwrite) int flightTimeInSec;
@property (readwrite) int chillTimeInSec;
@property (readwrite) float WingScale;

@property (readwrite) CGPoint _lastPosition;
@property (readwrite) float _standardWingShutter;
@property (readwrite) bool _isWingFlapComplete;

@property (readwrite) CGSize winSize;







+(instancetype)ButterflyWithPosition:(CGPoint)position wingScale:(float)scale;
-(instancetype)init;
-(void)setFlightStateToFalse;
-(void)Tick;


@end
