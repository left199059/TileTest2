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
NSString* _layerName;


-(id) initWithMap:(MapLayer *)map andLayer:(NSString* ) layerName
{
	self = [super init];
    if(self==nil)
        return nil;
    _layerName = layerName;
    
    _tileMap = map;
    
    return self;
}

+(id) navWithMap:(MapLayer *)map andLayer:(NSString* ) layerName
{
    return [[[self alloc] initWithMap:map andLayer:layerName] autorelease];
}





-(CGPoint) getNext:(CGPoint) currentPos
{
    currentPos = [_tileMap tilePosFromLocation:currentPos];

    CGPoint nextPos = [_tileMap getNextPoint2OnPathWithCurrent:currentPos AndPrevious:prevPos andLayer:_layerName];
    
    if(nextPos.x ==-1)
        return nextPos;
    
    prevPos = currentPos;
    nextPos = [_tileMap locationFromTilePos:nextPos];

    return nextPos;
}



@end
