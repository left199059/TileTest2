//
//  WalkingSprite.m
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "WalkingSprite.h"

@implementation WalkingSprite





-(id) initWithFile:(NSString *)filename
{
	self = [super initWithFile:filename];
    	if(self==nil)
        return nil;
    
    
    return self;
}

-(void) update:(ccTime)delta
{
    MapLayer* _tileMap = (MapLayer*)parent_;
    CGPoint pos = self.position;
    pos = [_tileMap tilePosFromLocation:pos];
    
//    if(pos.x<4)d
//    {
//        [GameScene gameOver];
//        
//    }

}


-(void) moveToPos:(CGPoint) pos
{
    [self stopAllActions];
    
    CGPoint oldPos = [self position];
    float distance = ccpDistance(oldPos, pos) ;
    
    float time = distance * 0.01f;
    CCMoveTo* move = [CCMoveTo actionWithDuration:time position:pos];
    CCCallFunc* callback = [CCCallFunc actionWithTarget:self selector:@selector(onArrived)];
    
    CCSequence* actions = [CCSequence actions:move,callback, nil];
    
    [self runAction:actions];
}

-(void) onArrived
{
    
}




@end
