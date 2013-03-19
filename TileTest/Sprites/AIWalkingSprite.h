//
//  AIWalkingSprite.h
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "CCSprite.h"

@interface AIWalkingSprite : WalkingSprite


+(id) spriteWithFile:(NSString *)filename andNav:(PathNav*) pathNav;


-(void) start;

@end
