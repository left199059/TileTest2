//
//  PointPathNav.m
//  TileTest
//
//  Created by left199059 on 3/17/13.
//
//

#import "PointPathNav.h"

@implementation PointPathNav


MapLayer* _mapLayer;
CGPoint prevPos;
NSString* _layerName;


-(id) initWithMap:(MapLayer *)map andLayer:(NSString* ) layerName
{
	self = [super init];
    if(self==nil)
        return nil;
    _layerName = layerName;
    
    _mapLayer = map;
    
    return self;
}

+(id) navWithMap:(MapLayer *)map andLayer:(NSString* ) layerName
{
    return [[[self alloc] initWithMap:map andLayer:layerName] autorelease];
}









-(CGPoint) getNextPoint2OnPathWithCurrent:(CGPoint)currentPos AndPrevious:(CGPoint) prevPos andLayer:(NSString *) layerName;
{
    CGPoint nextPos = CGPointMake(-1, -1);
    
    NSString* dir = [_mapLayer tileKey:@"dir" AtPoint:currentPos inLayer:layerName];
    
    
    for(int i= 1;i<=15;i++)
    {
        
        for(int x = currentPos.x -i;x<=currentPos.x+i;x++)
        {
            for(int y = currentPos.y -i;y<=currentPos.y+i;y++)
            {
                
                if(x<0 || y<0 || x>=_mapLayer->mapSize.width || y>=_mapLayer-> mapSize.height)
                    continue;
                
                if(x==currentPos.x && y==currentPos.y)
                    continue;
                
                if(x==prevPos.x && y==prevPos.y)
                    continue;
                
                nextPos = ccp(x,y);
                bool isPath = [_mapLayer tileExistsAtPoint:nextPos inLayer:layerName];
                
                if(isPath)
                {
                    
                    if(dir==nil) //no direction preferences
                        return nextPos;
                    else
                    {
                        //prefer to left
                        if([dir isEqualToString:@"left"] && x<currentPos.x)
                        {
                            if(y!=currentPos.y && [_mapLayer tileExistsAtPoint:ccp(nextPos.x, currentPos.y) inLayer:layerName])
                                continue;
                            
                            return nextPos;
                        }
                        
                        
                        if([dir isEqualToString:@"right"] && x>currentPos.x)
                        {
                            if(y!=currentPos.y && [_mapLayer tileExistsAtPoint:ccp(nextPos.x, currentPos.y) inLayer:layerName])
                                continue;
                            
                            return nextPos;
                        }
                        
                        if([dir isEqualToString:@"up"] && y<currentPos.y)
                        {
                            if(x!=currentPos.x && [_mapLayer tileExistsAtPoint:ccp(currentPos.x, nextPos.y) inLayer:layerName])
                                continue;
                            
                            return nextPos;
                        }
                        
                        if([dir isEqualToString:@"down"] && y>currentPos.y)
                        {
                            if(x!=currentPos.x && [_mapLayer tileExistsAtPoint:ccp(currentPos.x, nextPos.y) inLayer:layerName])
                                continue;
                            
                            return nextPos;
                        }
                    }
                    
                    
                    
                }//end of if(isPath)
                
            }//end of y
            
        }//end of x
        
    }
    
    
    
    //no match, end of path.
    nextPos = CGPointMake(-1, -1);
    return nextPos;
}




-(CGPoint) getNext:(CGPoint) currentPos
{
    currentPos = [_mapLayer tilePosFromLocation:currentPos];
    
    CGPoint nextPos = [self getNextPoint2OnPathWithCurrent:currentPos AndPrevious:prevPos andLayer:_layerName];
    
    if(nextPos.x ==-1)
        return nextPos;
    
    prevPos = currentPos;
    nextPos = [_mapLayer locationFromTilePos:nextPos];
    
    return nextPos;
}



@end
