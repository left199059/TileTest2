//
//  CCSpriteHelper.m
//  TileTest
//
//  Created by left199059 on 3/19/13.
//
//

#import "CCSpriteHelper.h"

@implementation CCSprite (Helper)

-(CCAction*) startAnimation:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay random:(bool)random tag:(int)tag
{
    CCAnimation* anim = [CCAnimation animationWithFile:frameSetName frameCount:frameCount delay:delay random:random];
 
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
    animate.tag = tag;
    return [self runAction:animate];
}

-(CCAction*) startAnimationRepeat:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay  random:(bool)random tag:(int)tag
{
    CCAnimation* anim = [CCAnimation animationWithFile:frameSetName frameCount:frameCount delay:delay random:random];
    
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
    CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate];
    repeat.tag = tag;
    return [self runAction:repeat ];
}



@end
