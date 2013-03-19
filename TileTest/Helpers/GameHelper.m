//
//  GameHelper.m
//  TileTest
//
//  Created by left199059 on 3/14/13.
//
//

#import "GameHelper.h"

@implementation GameHelper



+(CGPoint) locationFromTouch:(UITouch*)touch
{
    
	CGPoint touchLocation = [touch locationInView:touch.view];
	CGPoint openGLLoc = [[CCDirector sharedDirector] convertToGL:touchLocation];

    
    return openGLLoc;
}

+(CGPoint) locationDeltaFromTouch:(UITouch*)touch
{
    UIView* view = touch.view;
	CGPoint touchLocation = [touch locationInView:view];
    CGPoint previousTouchLocation = [touch previousLocationInView:view];
    
	CGPoint  p = [[CCDirector sharedDirector] convertToGL:touchLocation];
    CGPoint  p2 = [[CCDirector sharedDirector] convertToGL:previousTouchLocation];
    
    return ccp(p.x- p2.x, p.y-p2.y);
}



@end
