//
//  MapLayer.h
//  TileTest
//
//  Created by left199059 on 3/15/13.
//
//

#import <Foundation/Foundation.h>

@interface MapLayer : CCLayer
{
    CGSize mapSize;
    
    CCTMXTiledMap* _tileMap;
    
}

-(CGPoint) locationInParent:(CGPoint)pos;

-(id) initWithTMX:(NSString*) tmxFile AndMap:(NSString*)mapFile AndEventLayer:(NSString*)eventLayerName;

-(bool)tileHasKey:(NSString*) key AtPoint:(CGPoint)tilePos inLayer:(NSString*) layerName;

-(bool)tileExistsAtPoint:(CGPoint)tilePos inLayer:(NSString*) layerName;

-(CGPoint) tilePosFromLocation:(CGPoint)location;

-(CGPoint) locationFromTilePos:(CGPoint) pos;

-(CGPoint) getNextPointOnPathWithCurrent:(CGPoint)currentPos AndPrevious:(CGPoint) prevPos;


-(CGPoint) getNextPoint2OnPathWithCurrent:(CGPoint)currentPos AndPrevious:(CGPoint) prevPos andLayer:(NSString *) layerName;


-(NSString*)tileKey:(NSString*) key AtPoint:(CGPoint)tilePos inLayer:(NSString*) layerName;

@end
