//
//  PointPathNav.h
//  TileTest
//
//  Created by left199059 on 3/17/13.
//
//

#import <Foundation/Foundation.h>

@interface PointPathNav : PathNav

{
    MapLayer* _mapLayer;
    CGPoint prevPos;
    //NSString* _layerName;
}

@property (copy) NSString* layerName;

-(id) initWithMap:(MapLayer *)map andLayer:(NSString* ) layerName;


+(id) navWithMap:(MapLayer *)map andLayer:(NSString* ) layerName;


-(CGPoint) getFirst;



@end
