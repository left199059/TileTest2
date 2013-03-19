//
//  CCSpriteHelper.m
//  TileTest
//
//  Created by left199059 on 3/19/13.
//
//

#import "CCSpriteHelper.h"

@implementation CCSprite (Helper)

-(CCAction*) startAnimation:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay
{
    CCAnimation* anim = [CCAnimation animationWithFile:frameSetName frameCount:frameCount delay:delay reverse:NO];
    
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
 
    return [self runAction:animate];
}

-(CCAction*) startAnimationRepeat:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay
{
    CCAnimation* anim = [CCAnimation animationWithFile:frameSetName frameCount:frameCount delay:delay reverse:NO];
    
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
    CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate];
    
    return [self runAction:repeat];
}



@end
