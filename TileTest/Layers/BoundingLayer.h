//
//  BoundingLayer.h
//  TileTest
//
//  Created by left199059 on 3/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BoundingLayer : CCLayer {
@private
    
    CGPoint speed;
    CGSize movingBound;
    CGSize screenSize;
    float friction ;
}

-(void) setScreenSize:(CGSize)size;

-(void) setBound:(CGSize)bound;
@end



