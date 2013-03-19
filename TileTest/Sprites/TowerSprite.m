//
//  TowerSprite.m
//  TileTest
//
//  Created by left199059 on 3/18/13.
//
//

#import "TowerSprite.h"

@implementation TowerSprite


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    bool ret = [super ccTouchBegan:touch withEvent:event];
    
    if(ret)
    {
        self.scale = 1.5f;
    }
    
    return ret;
}


-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.scale = 1;
}

-(void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    self.scale = 1;
}
@end
