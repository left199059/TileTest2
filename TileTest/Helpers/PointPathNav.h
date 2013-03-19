//
//  PointPathNav.h
//  TileTest
//
//  Created by left199059 on 3/17/13.
//
//

#import <Foundation/Foundation.h>

@interface PointPathNav : PathNav


-(id) initWithMap:(MapLayer *)map andLayer:(NSString* ) layerName;


+(id) navWithMap:(MapLayer *)map andLayer:(NSString* ) layerName;



@end
