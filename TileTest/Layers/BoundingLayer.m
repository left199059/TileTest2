//
//  BoundingLayer.m
//  TileTest
//
//  Created by left199059 on 3/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BoundingLayer.h"


@implementation BoundingLayer


-(id) init
{
	
	if ((self=[super init])==nil)
        return nil;
    
    //speedFactor = 1.5f;
    friction = 0.90f;
    screenSize = [[CCDirector sharedDirector]winSize];

    self.isTouchEnabled = true;
	
    [self scheduleUpdate];
    
	return self;
}

-(void) setBound:(CGRect)bound
{
    movingBound = bound;
}

-(void) setScreenSize:(CGSize)size
{
    screenSize = size;
}


-(void) update:(ccTime) delta
{
    if(speed.x==0 && speed.y==0)
        return;
    
    CGPoint pos = self.position;
    pos.x+=speed.x ;
    pos.y+=speed.y ;
    
    speed.x*=friction;
    speed.y*=friction;
    
    if(abs(speed.x)<1)
        speed.x =0;
    if(abs(speed.y)<1)
        speed.y =0;
    
    if(pos.x > movingBound.origin.x)
        pos.x = movingBound.origin.x;
    if(pos.y > movingBound.origin.y)
        pos.y = movingBound.origin.y;
    
    float xLim = -( movingBound.origin.x + movingBound.size.width - screenSize.width);
    if(pos.x < xLim && xLim <=0)
    {
        pos.x = MIN(xLim,0);
    }
        
    
    float yLim = -(movingBound.origin.y + movingBound.size.height- screenSize.height);
    
    if(pos.y < yLim)
    {
  
        pos.y = MIN(yLim,0);

    }
    
    
    
    self.position =pos;
    

}



-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    CGPoint delta = [GameHelper locationDeltaFromTouch:[touches anyObject]];
    speed.x = delta.x;//* speedFactor;
    speed.y = delta.y;//* speedFactor;
}



@end
