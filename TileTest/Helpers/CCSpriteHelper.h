//
//  CCSpriteHelper.h
//  TileTest
//
//  Created by left199059 on 3/19/13.
//
//

#import <Foundation/Foundation.h>

@interface CCSprite (Helper)

-(CCAction*) startAnimation:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay;


-(CCAction*) startAnimationRepeat:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay;



@end
