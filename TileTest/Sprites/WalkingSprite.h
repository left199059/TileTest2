//
//  WalkingSprite.h
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "CCSprite.h"

@interface WalkingSprite : CCSprite

{
@public
    float speed;

    int health;
    
}
-(id) initWithFile:(NSString *)filename ;

-(void) moveToPos:(CGPoint) pos;


-(void) update:(ccTime)delta;


-(void) damage:(int) amount;

-(void) start;


@end
