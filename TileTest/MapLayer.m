//
//  MapLayer.m
//  TileTest
//
//  Created by left199059 on 3/15/13.
//
//

#import "MapLayer.h"

@implementation MapLayer



-(id) initWithTMX:(NSString*) tmxFile AndMap:(NSString*)mapFile
{
	
	if((self=[super init])==nil)
        return nil;
    
    _tileMap = [CCTMXTiledMap tiledMapWithTMXFile:tmxFile];
    [self addChild:_tileMap z:-1];
    
    CCSprite * mapSprite = [CCSprite spriteWithFile: mapFile];
    mapSprite.anchorPoint = ccp(0, 0);
    [self addChild:mapSprite z:-2];
    mapSize = mapSprite.texture.contentSize;
    

    
//    for(int i=1;i<=8;i++)
//    {
//        NSString* name = [NSString stringWithFormat:@"PATH%i",i];
//        
//        CCTMXLayer* _eventLayer = [_tileMap layerNamed:name];
//        _eventLayer.visible = NO;
//    }

    
    [self unscheduleUpdate];
    [self scheduleUpdate];
    
	return self;
}

-(void) update:(ccTime) delta
{
    //[super update:delta];
}

-(CGPoint) locationInParent:(CGPoint)pos
{
    pos.x -= [self parent].position.x;
    pos.y -= [self parent].position.y;
    return pos;
}

-(CGPoint) tilePosFromLocation:(CGPoint)location
{
	CGPoint pos = location ;//ccpSub(location, tileMap.position);
	
	// scaling tileSize to Retina display size
	//float pointWidth = mapSize.width / CC_CONTENT_SCALE_FACTOR();
	//float pointHeight = mapSize.height / CC_CONTENT_SCALE_FACTOR();
	
    int mapHeight = _tileMap.mapSize.height;
    
	pos.x = (int)(pos.x / _tileMap.tileSize.width);
	pos.y = (int)(pos.y / _tileMap.tileSize.height);
	
    pos.y = mapHeight - pos.y - 1;
    
	//CCLOG(@"(%.0f, %.0f) is (%i, %i)", location.x, location.y, (int)pos.x, (int)pos.y);
    
	return pos;
}


-(CGPoint) getNextPoint2OnPathWithCurrent:(CGPoint)currentPos AndPrevious:(CGPoint) prevPos andLayer:(NSString *) layerName;
{
    CGPoint nextPos = CGPointMake(-1, -1);
    
    NSString* dir = [self tileKey:@"dir" AtPoint:currentPos inLayer:layerName];
    
    NSMutableArray* candidates = [NSMutableArray array];
    
    for(int i= 1;i<=20;i++)
    {
    
        for(int x = currentPos.x -i;x<=currentPos.x+i;x++)
        {
            for(int y = currentPos.y -i;y<=currentPos.y+i;y++)
            {
                if(x<0 || y<0 || x>=_tileMap.mapSize.width || y>=_tileMap.mapSize.height)
                    continue;
                
                if(x==currentPos.x && y==currentPos.y)
                    continue;
                
                if(x==prevPos.x && y==prevPos.y)
                    continue;
                
                nextPos = ccp(x,y);
                bool isPath = [self tileExistsAtPoint:nextPos inLayer:layerName];
                
                if(isPath)
                {
                    CGPoint candidate = CGPointMake(-1, -1);
                    
                    if(dir==nil)
                        candidate = nextPos;
                    else
                    {
                        if([dir isEqualToString:@"left"] && x<currentPos.x)
                        {
                            if(y!=currentPos.y && [self tileExistsAtPoint:ccp(nextPos.x, currentPos.y) inLayer:layerName])
                                continue;
                            
                            candidate = nextPos;
                        }
                        
                        
                        if([dir isEqualToString:@"right"] && x>currentPos.x)
                        {
                            if(y!=currentPos.y && [self tileExistsAtPoint:ccp(nextPos.x, currentPos.y) inLayer:layerName])
                                continue;
                            
                            candidate = nextPos;
                        }
                        
                        if([dir isEqualToString:@"up"] && y<currentPos.y)
                        {
                            if(x!=currentPos.x && [self tileExistsAtPoint:ccp(currentPos.x, nextPos.y) inLayer:layerName])
                                continue;
                            
                            candidate = nextPos;
                        }
                        
                        if([dir isEqualToString:@"down"] && y>currentPos.y)
                        {
                            if(x!=currentPos.x && [self tileExistsAtPoint:ccp(currentPos.x, nextPos.y) inLayer:layerName])
                                continue;
                            
                            candidate = nextPos;
                        }
                    }
                    
                    if(candidate.x!=-1)
                        [candidates addObject:[NSValue valueWithCGPoint:candidate]];
                    
                }
                
            }
        }//end of xy loop
        
        if([candidates count]>0)
        {
            int index = rand()%[candidates count];
            nextPos = [[candidates objectAtIndex:index] CGPointValue];
            return nextPos;
        }

        
    }
    
    //no match, end of path.
    nextPos = CGPointMake(-1, -1);
    return nextPos;
}



-(CGPoint) getNextPointOnPathWithCurrent:(CGPoint)currentPos AndPrevious:(CGPoint) prevPos
{
    CGPoint nextPos = CGPointMake(-1, -1);
    
    NSString* dir = [self tileKey:@"dir" AtPoint:currentPos inLayer:@"PathLayer"];
    
    NSMutableArray* candidates = [NSMutableArray array];
    
    for(int x = currentPos.x -1;x<=currentPos.x+1;x++)
    {
        for(int y = currentPos.y -1;y<=currentPos.y+1;y++)
        {
            if(x<0 || y<0 || x>=_tileMap.mapSize.width || y>=_tileMap.mapSize.height)
                continue;
            
            if(x==currentPos.x && y==currentPos.y)
                continue;
            
            if(x==prevPos.x && y==prevPos.y)
                continue;
        
            nextPos = ccp(x,y);
            bool isPath = [self tileExistsAtPoint:nextPos inLayer:@"PathLayer"];
            
            if(isPath)
            {
                CGPoint candidate = CGPointMake(-1, -1);
                
                if(dir==nil)
                    candidate = nextPos;
                else
                {
//                    if([dir isEqualToString:@"left"] && x<currentPos.x)
//                        candidate = nextPos;
//                    
//                    if([dir isEqualToString:@"right"] && x>currentPos.x)
//                        candidate = nextPos;
//                    
//                    if([dir isEqualToString:@"up"] && y<currentPos.y)
//                        candidate = nextPos;
//                    
//                    if([dir isEqualToString:@"down"] && y>currentPos.y)
//                        candidate = nextPos;
                    
                    
                    if([dir isEqualToString:@"left"] && x<currentPos.x)
                    {
                        if(y!=currentPos.y && [self tileExistsAtPoint:ccp(nextPos.x, currentPos.y) inLayer:@"PathLayer"])
                            continue;
                        
                        candidate = nextPos;
                    }
                        
                    
                    if([dir isEqualToString:@"right"] && x>currentPos.x)
                    {
                        if(y!=currentPos.y && [self tileExistsAtPoint:ccp(nextPos.x, currentPos.y) inLayer:@"PathLayer"])
                            continue;
                        
                        candidate = nextPos;
                    }
                    
                    if([dir isEqualToString:@"up"] && y<currentPos.y)
                    {
                        if(x!=currentPos.x && [self tileExistsAtPoint:ccp(currentPos.x, nextPos.y) inLayer:@"PathLayer"])
                            continue;
                        
                        candidate = nextPos;
                    }
                    
                    if([dir isEqualToString:@"down"] && y>currentPos.y)
                    {
                        if(x!=currentPos.x && [self tileExistsAtPoint:ccp(currentPos.x, nextPos.y) inLayer:@"PathLayer"])
                            continue;
                        
                        candidate = nextPos;
                    }
                }
                
                if(candidate.x!=-1)
                    [candidates addObject:[NSValue valueWithCGPoint:candidate]];
                
            }

        }
    }

    if([candidates count]>0)
    {
        int index = rand()%[candidates count];
        nextPos = [[candidates objectAtIndex:index] CGPointValue];
    }
    else{
        nextPos = CGPointMake(-1, -1);
    }

    return nextPos;
}


-(CGPoint) locationFromTilePos:(CGPoint) pos
{
    pos.x *= _tileMap.tileSize.width;
    pos.y = _tileMap.mapSize.height - pos.y - 1;
    pos.y *= _tileMap.tileSize.height;
    
    
    //CCLOG(@"pos  (%i, %i)",  (int)pos.x, (int)pos.y);
    
    return pos;
}

-(bool)tileExistsAtPoint:(CGPoint)tilePos inLayer:(NSString*) layerName
{
    CCTMXLayer* layer = [_tileMap layerNamed:layerName];
    int tileGID = [layer tileGIDAt:tilePos];

    return tileGID!=0;
}



-(bool)tileHasKey:(NSString*) key AtPoint:(CGPoint)tilePos inLayer:(NSString*) layerName
{
    CCTMXLayer* layer = [_tileMap layerNamed:layerName];
    int tileGID = [layer tileGIDAt:tilePos];
    BOOL isHeroPath = false;
    if(tileGID!=0)
    {
        NSDictionary* properties = [_tileMap propertiesForGID:tileGID];
        if(properties)
        {
            NSString* strIsHeroPath = [properties valueForKey:key];
            isHeroPath = [strIsHeroPath boolValue];
            
        }
    }
    return isHeroPath;
}


-(NSString*)tileKey:(NSString*) key AtPoint:(CGPoint)tilePos inLayer:(NSString*) layerName
{
    CCTMXLayer* layer = [_tileMap layerNamed:layerName];
    int tileGID = [layer tileGIDAt:tilePos];
    NSString* value = nil;
    if(tileGID!=0)
    {
        NSDictionary* properties = [_tileMap propertiesForGID:tileGID];
        if(properties)
        {
            value = [properties valueForKey:key];
        }
    }
    return value;
}




@end
