//
//  Butterfly.m
//  ButterflyAnimation
//
//  Created by Reza Shirazian on 2/3/2014.
//  Copyright 2014 Reza Shirazian. All rights reserved.
//

#import "Butterfly.h"


@implementation Butterfly



+(instancetype)ButterflyWithPosition:(CGPoint)position wingScale:(float)scale
{
    return ([[Butterfly alloc] initWithPosition:position wingScale:scale]);
}
-(instancetype)init
{
    self = [super init];
    if(!self)return(nil);

    
    return self;
}
-(instancetype)initWithPosition:(CGPoint)posi wingScale:(float)scale
{
    self = [self init];
    if(!self)return(nil);
    
    [self setWinSize:[[CCDirector sharedDirector] viewSize] ];
    //CCLOG(@"width of view is %f",[[CCDirector sharedDirector]viewSize].width);
    

    [self setWingScale:scale];
    [self SetWings];
    //self.positionType = CCPositionTypeNormalized;
    self.position = posi;
    self._lastPosition = posi;
  //  [self schedule:@selector(Tick) interval:<#(CCTime)#>];
    return self;
}
-(void)Tick
{

}

- (void) onEnter {
    
    [super onEnter];
}
-(void)SetWings
{

    
    [self setFlightState:NO];
    [self setWingShutter:0.15f];
    [self setNewControlPoints];
    self._standardWingShutter = 0.15f;
    self._isWingFlapComplete = false;
    
    int wingColor = arc4random() % 3;
    CCLOG(@"random wing is  %d",wingColor);
    
    
    switch (wingColor) {
        case 0:
            [self setLeftWing:[CCSprite spriteWithImageNamed:@"LeftWing.png"]];
            [self setRightWing:[CCSprite spriteWithImageNamed:@"RightWing.png"]];
            break;
        case 1:
            [self setLeftWing:[CCSprite spriteWithImageNamed:@"LeftWing1.png"]];
            [self setRightWing:[CCSprite spriteWithImageNamed:@"RightWing1.png"]];
            break;
        case 2:
            [self setLeftWing:[CCSprite spriteWithImageNamed:@"LeftWing2.png"]];
            [self setRightWing:[CCSprite spriteWithImageNamed:@"RightWing2.png"]];
            break;
            
        default:
            break;
    }
    
   
    
    self.LeftWing.positionType = CCPositionTypeNormalized;
    self.LeftWing.scale = self.WingScale;
    self.LeftWing.position = ccp(0.0f,0.0f);
    
  
   // self.RightWing.positionType = CCPositionTypeNormalized;
    CCLOG(@"with of left wing is %f",self.LeftWing.boundingBox.size.width);
    self.RightWing.scale = self.WingScale;
    
    
    self.RightWing.position = ccp(self.LeftWing.boundingBox.size.width,0.0f);
    
    [self addChild:self.LeftWing];
    [self addChild:self.RightWing];
    
    [self AnimateWings:self.RightWing];
    [self AnimateWingsOther:self.LeftWing];
   
    [self MoveAlongBezier];
    
}
-(void)setNewControlPoints
{
    int randomWidth1 = arc4random() % ((int)self.winSize.width);
    int randomWidth2 = arc4random() % ((int)self.winSize.width);
    int randomWidth3 = arc4random() % ((int)self.winSize.width);
    
    
    int randomHeight1 = arc4random() % ((int)self.winSize.height);
    int randomHeight2 = arc4random() % ((int)self.winSize.height);
    int randomHeight3 = arc4random() % ((int)self.winSize.height);
    
    int flightTime =arc4random() % 5;
    int chillTime = arc4random() % 5;
    
    flightTime = flightTime + 5;
    chillTime = chillTime + 1;
    
    [self setControlPoint1:ccp(randomWidth1,randomHeight1)];
    [self setControlPoint2:ccp(randomWidth2,randomHeight2)];
    [self setEndPosition:ccp(randomWidth3,randomHeight3)];
    [self setFlightTimeInSec:flightTime];
    [self setChillTimeInSec:chillTime];
}


-(void) MoveAlongBezier
{
     [self setFlightState:YES];
    //[self setPositionType:CCPositionTypePoints];
    ccBezierConfig bezier;
    
    bezier.controlPoint_1 = [self ControlPoint1];
    bezier.controlPoint_2 = [self ControlPoint2];
    bezier.endPosition =[self EndPosition];
    
    id bezierForward = [CCActionBezierTo actionWithDuration:self.flightTimeInSec bezier:bezier];
    id doneFlight = [[CCActionCallFunc alloc]initWithTarget:self selector:@selector(setFlightStateToFalse)];
    id chill =[[CCActionDelay alloc]initWithDuration:self.chillTimeInSec];
    
    id fly = [CCActionSequence actions:bezierForward,chill,doneFlight,nil];
    [self runAction:fly];
   
 
    
}
-(void)setFlightState:(bool)value
{
   _isInFlight = value;
}
-(void) setFlightStateToFalse
{
    _isInFlight = NO;
}
-(void) setWingFlapComplete
{
    self._isWingFlapComplete = YES;
}
- (void)AnimateWings:(CCSprite*)wing
{
    
    self._isWingFlapComplete = false;
    id skew = [[CCActionSkewTo alloc]initWithDuration:self.wingShutter skewX:0.0f skewY:15.0f ];
    id skewBack = [[CCActionSkewTo alloc]initWithDuration:self.wingShutter - 0.09 skewX:0.0f skewY:-20.0f];
    id doneFlap = [[CCActionCallFunc alloc]initWithTarget:self selector:@selector(setWingFlapComplete)];

    id seq = [CCActionSequence actions:skew,skewBack,doneFlap, nil];
   // id repeat = [CCActionRepeatForever actionWithAction:seq];
    [wing runAction:seq];

    
    
}
- (void)AnimateWingsOther:(CCSprite*)wing
{
    self._isWingFlapComplete = false;
    id skew = [[CCActionSkewTo alloc]initWithDuration:self.wingShutter skewX:0.0f skewY:-15.0f ];
    id skewBack = [[CCActionSkewTo alloc]initWithDuration:self.wingShutter - 0.09 skewX:0.0f skewY:20.0f];
    id doneFlap = [[CCActionCallFunc alloc]initWithTarget:self selector:@selector(setWingFlapComplete)];
    
    id seq = [CCActionSequence actions:skew,skewBack, doneFlap, nil];
  //  id repeat = [CCActionRepeatForever actionWithAction:seq];
    [wing runAction:seq];
    
    
    
}
- (void)dealloc
{
    CCLOG(@"The wings were deallocated");
    // clean up code goes here, should there be any
    
}
-(void)slowWingShutter
{
    [self setWingShutter:self._standardWingShutter*8.0f];
}
-(void)fastWingShutter
{
    [self setWingShutter:self._standardWingShutter];
}
-(void)update:(CCTime)delta
{
    if(self._isWingFlapComplete)
    {
        [self AnimateWings:self.RightWing];
        [self AnimateWingsOther:self.LeftWing];
    }
    if(![self isInFlight])
    {
        [self setNewControlPoints];
        [self MoveAlongBezier];
    }
    else{
        
        CGPoint vector = ccpSub(self.position, self._lastPosition);
        float rot = atan2(vector.x, vector.y) * 180 / M_PI;
        if (rot != 0.0f)
        {
            //is not chilling
            self.rotation = rot;
            [self fastWingShutter];
            
        }else {
            //is chilling
            [self slowWingShutter];
        }

        self._lastPosition = self.position;
        

    }
    
}


@end
