//
//  AnimationSprite.m
//  TileTest
//
//  Created by left199059 on 3/18/13.
//
//

#import "AnimationSprite.h"

@implementation AnimationSprite

-(void) startAnimation:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay
{
    CCAnimation* anim = [CCAnimation animationWithFile:frameSetName frameCount:frameCount delay:delay];
    
    CCAnimate* animate = [CCAnimate actionWithAnimation:anim];
    CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate];
    
    [self runAction:repeat];
}

@end
