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
    mapPixcelSize = mapSprite.texture.contentSize;
    mapSize = _tileMap.mapSize;
    

    
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
