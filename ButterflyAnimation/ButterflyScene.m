//
//  ButterflyScene.m
//  ButterflyAnimation
//
//  Created by Reza Shirazian on 2/3/2014.
//  Copyright 2014 Reza Shirazian. All rights reserved.
//

#import "ButterflyScene.h"
#import "Butterfly.h"
#import "cocos2d.h"


@implementation ButterflyScene



CGSize _screenSize;

+ (ButterflyScene *)scene
{
    
    return [[self alloc]init];
    
}
- (id)init
{
    
    self = [super init];
    if(!self)return (nil);
    
    self.userInteractionEnabled = YES;
    
    _screenSize = [[CCDirector sharedDirector]viewSize];
    
    
    CCSprite* bg = [CCSprite spriteWithImageNamed:@"bg.png"];
    bg.anchorPoint = ccp(0.0f,0.0f);
    bg.positionType = CCPositionTypeNormalized;
    bg.position = ccp(0.0f,0.0f);
    
    
   [self addChild:bg];
    
    Butterfly* butterfly = [Butterfly ButterflyWithPosition:CGPointMake(_screenSize.width/2.0f, _screenSize.height/2.0f) wingScale:0.2];

    [butterfly setPositionType:CCPositionTypePoints];
    [self addChild:butterfly];
    
    Butterfly* butterfly2 = [Butterfly ButterflyWithPosition:CGPointMake(_screenSize.width/2.0f, _screenSize.height/2.0f)wingScale:0.25];
    
    [butterfly2 setPositionType:CCPositionTypePoints];
    [self addChild:butterfly2];
    
    Butterfly* butterfly3 = [Butterfly ButterflyWithPosition:CGPointMake(_screenSize.width/2.0f, _screenSize.height/2.0f)wingScale:0.18];
   
    [butterfly3 setPositionType:CCPositionTypePoints];
    [self addChild:butterfly3];
    
    Butterfly* butterfly4 = [Butterfly ButterflyWithPosition:CGPointMake(_screenSize.width/2.0f, _screenSize.height/2.0f)wingScale:0.22];
  
    [butterfly4 setPositionType:CCPositionTypePoints];
    [self addChild:butterfly4];
    
    Butterfly* butterfly5 = [Butterfly ButterflyWithPosition:CGPointMake(_screenSize.width/2.0f, _screenSize.height/2.0f)wingScale:0.18];

    [butterfly5 setPositionType:CCPositionTypePoints];
    [self addChild:butterfly5];
    
    Butterfly* butterfly6 = [Butterfly ButterflyWithPosition:CGPointMake(_screenSize.width/2.0f, _screenSize.height/2.0f)wingScale:0.2];

    [butterfly6 setPositionType:CCPositionTypePoints];
    [self addChild:butterfly6];
    
    Butterfly* butterfly7 = [Butterfly ButterflyWithPosition:CGPointMake(_screenSize.width/2.0f, _screenSize.height/2.0f)wingScale:0.27];

    [butterfly7 setPositionType:CCPositionTypePoints];
    [self addChild:butterfly7];
    
    

    
  
    return self;
    
    
}
-(void)MoveButterflyAlongBezier:(Butterfly*)butterfly
{
      
    

}
-(void)dealloc
{

}

-(void)onEnter
{
    [super onEnter];
}

-(void)onExit
{
    [super onExit];
}


@end
