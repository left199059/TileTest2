//
//  WalkingSprite.m
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "WalkingSprite.h"

@implementation WalkingSprite

const int moveActionTag = 100;
const int aniActionTag = 101;



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


-(void) onDead
{
    //sound
    [[SimpleAudioEngine sharedEngine] playEffect:@"alien-sfx.caf" ];
    
    //top old animation
    [self stopActionByTag:moveActionTag];
    [self stopActionByTag:aniActionTag];
    
    //scale
    CCScaleTo* scale = [CCScaleTo actionWithDuration:3 scale:3.0];
    CCCallFunc* callback = [CCCallFunc actionWithTarget:self selector:@selector(deadCleanup)];
    CCSequence* scaleAndCallback = [CCSequence actions:scale,callback, nil];
    [self runAction:scaleAndCallback];
    
    //dead animation
    [self startAnimation:@"ZombieDead"  frameCount:3 delay:1 random:NO tag:aniActionTag];
    
}

-(void) deadCleanup
{
    self.visible = false;
    
}

-(void)onDamage
{
    
}

-(void) damage:(int) amount
{
    if(health<=0)
        return ;
    
    health-=amount;
    if(health<=0)
    {
        health = 0;
        [self onDead];
    }
    else{
        [self onDamage];
    }
    
    return;
}

-(void) moveToPos:(CGPoint) pos
{
    if(!self.visible)
        return ;
    
    [self stopActionByTag:moveActionTag];
    
    CGPoint oldPos = [self position];
    float distance = ccpDistance(oldPos, pos) ;
    
    float time = distance * speed;
    CCMoveTo* move = [CCMoveTo actionWithDuration:time position:pos];
    CCCallFunc* callback = [CCCallFunc actionWithTarget:self selector:@selector(onArrived)];
    CCSequence* moveAction = [CCSequence actions:move,callback, nil];
    
    moveAction.tag = moveActionTag;
    [self runAction:moveAction];
}

-(void) onArrived
{
    
}

-(void) start
{
    
    self.visible = true;
    self.scale = 1;
    [self startAnimationRepeat:@"ZombieMove"  frameCount:6 delay:0.15 random:YES tag:aniActionTag];
    
}


@end
