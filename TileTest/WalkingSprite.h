//
//  WalkingSprite.h
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "CCSprite.h"

@interface WalkingSprite : AnimationSprite

{
    @public
    float speed;
}
-(id) initWithFile:(NSString *)filename ;

-(void) moveToPos:(CGPoint) pos;


-(void) update:(ccTime)delta;

@end
