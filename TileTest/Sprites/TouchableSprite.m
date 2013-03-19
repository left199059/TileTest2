//
//  TouchableSprite.m
//  TileTest
//
//  Created by left199059 on 3/19/13.
//
//

#import "TouchableSprite.h"

@implementation TouchableSprite




- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ( ![self containsTouchLocation:touch] )
    {
        return NO;
    }
    CGPoint pooint =   [self convertTouchToNodeSpaceAR:touch];
    return YES;
}




- (void) onEnter
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}


- (void) onExit
{
    [[CCTouchDispatcher sharedDispatcher]    addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onExit];
}


- (CGRect)rect
{
    CGSize s = [self.texture contentSize];
    return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
}


- (BOOL)containsTouchLocation:(UITouch *)touch
{
    return CGRectContainsPoint(self.rect, [self convertTouchToNodeSpaceAR:touch]);
}


@end
