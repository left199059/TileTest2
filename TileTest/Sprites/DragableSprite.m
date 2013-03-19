//
//  MovableSprite.m
//  TileTest
//
//  Created by left199059 on 3/19/13.
//
//



@implementation DragableSprite



- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
    
    touchPoint = [[CCDirector sharedDirector] convertToUI:CGPointMake(touchPoint.x, touchPoint.y)];
    
    
    
    self.position = CGPointMake(touchPoint.x, touchPoint.y);
}



@end
