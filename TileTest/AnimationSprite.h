//
//  AnimationSprite.h
//  TileTest
//
//  Created by left199059 on 3/18/13.
//
//

#import "CCSprite.h"

@interface AnimationSprite : CCSprite

-(void) startAnimation:(NSString*) frameSetName frameCount:(int)frameCount delay:(float)delay;


@end
