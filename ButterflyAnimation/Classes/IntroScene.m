//
//  IntroScene.m
//  ButterflyAnimation
//
//  Created by Reza Shirazian on 2/3/2014.
//  Copyright Reza Shirazian 2014. All rights reserved.
//
// -----------------------------------------------------------------------

// Import the interfaces
#import "IntroScene.h"
#import "ButterflyScene.h"

// -----------------------------------------------------------------------
#pragma mark - IntroScene
// -----------------------------------------------------------------------

@implementation IntroScene

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (IntroScene *)scene
{
	return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    // Create a colored background (Dark Grey)
    CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.0f]];
    [self addChild:background];
    
    
    CCLabelTTF* label = [CCLabelTTF labelWithString:@"Butterfly Simulation" fontName:@"Chalkduster" fontSize:36.0f];
    label.positionType = CCPositionTypeNormalized;
    label.color = [CCColor redColor];
    label.position = ccp(0.5f,0.5f);
    [self addChild:label];
    
    CCButton* butterflyButton = [CCButton buttonWithTitle:@"Butterfly" fontName:@"Verdana-Bold" fontSize:18.0f];
    butterflyButton.positionType = CCPositionTypeNormalized;
    butterflyButton.position = ccp (0.5f,0.35);
    [butterflyButton setTarget:self selector:@selector(onButterflyClicked:)];
    [self addChild:butterflyButton];
    
//    // Hello world
//    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Chalkduster" fontSize:36.0f];
//    label.positionType = CCPositionTypeNormalized;
//    label.color = [CCColor redColor];
//    label.position = ccp(0.5f, 0.5f); // Middle of screen
//    [self addChild:label];
//    
//    // Spinning scene button
//    CCButton *spinningButton = [CCButton buttonWithTitle:@"[ Simple Sprite ]" fontName:@"Verdana-Bold" fontSize:18.0f];
//    spinningButton.positionType = CCPositionTypeNormalized;
//    spinningButton.position = ccp(0.5f, 0.35f);
//    [spinningButton setTarget:self selector:@selector(onSpinningClicked:)];
//    [self addChild:spinningButton];
//
//    // Next scene button
//    CCButton *newtonButton = [CCButton buttonWithTitle:@"[ Newton Physics ]" fontName:@"Verdana-Bold" fontSize:18.0f];
//    newtonButton.positionType = CCPositionTypeNormalized;
//    newtonButton.position = ccp(0.5f, 0.20f);
//    [newtonButton setTarget:self selector:@selector(onNewtonClicked:)];
//    [self addChild:newtonButton];
	
    // done
	return self;
}

// -----------------------------------------------------------------------
#pragma mark - Button Callbacks
// -----------------------------------------------------------------------

-(void)onButterflyClicked:(id)sender
{
    [[CCDirector sharedDirector]replaceScene:[ButterflyScene scene] withTransition:[CCTransition transitionCrossFadeWithDuration:1.0]];
}
//- (void)onSpinningClicked:(id)sender
//{
//    // start spinning scene with transition
//    [[CCDirector sharedDirector] replaceScene:[HelloWorldScene scene]
//                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:1.0f]];
//}
//
//- (void)onNewtonClicked:(id)sender
//{
//    // start newton scene with transition
//    // the current scene is pushed, and thus needs popping to be brought back. This is done in the newton scene, when pressing back (upper left corner)
//    [[CCDirector sharedDirector] pushScene:[NewtonScene scene]
//                            withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:1.0f]];
//}

// -----------------------------------------------------------------------
@end
