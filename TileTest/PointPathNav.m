//
//  PointPathNav.m
//  TileTest
//
//  Created by left199059 on 3/17/13.
//
//

#import "PointPathNav.h"

@implementation PointPathNav


MapLayer* _tileMap;
CGPoint prevPos;


-(id) initWithMap:(MapLayer *)map
{
	self = [super init];
    if(self==nil)
        return nil;
    
    
    _tileMap = map;
    
    return self;
}

+(id) navWithMap:(MapLayer *)map
{
    return [[[self alloc] initWithMap:map] autorelease];
}




-(CGPoint) getNext:(CGPoint) currentPos
{
    currentPos = [_tileMap tilePosFromLocation:currentPos];

    CGPoint nextPos = [_tileMap getNextPoint2OnPathWithCurrent:currentPos AndPrevious:prevPos];
    
    if(nextPos.x ==-1)
        return nextPos;
    
    prevPos = currentPos;
    nextPos = [_tileMap locationFromTilePos:nextPos];

    return nextPos;
}



@end
