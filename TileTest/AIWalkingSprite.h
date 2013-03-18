//
//  AIWalkingSprite.h
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "CCSprite.h"

@interface AIWalkingSprite : WalkingSprite

-(id) initWithFile:(NSString *)filename andNav:(PathNav*) pathNav;

+(id) spriteWithFile:(NSString *)filename andNav:(PathNav*) pathNav;

-(void) start;

@end
