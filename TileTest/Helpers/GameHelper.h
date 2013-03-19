//
//  GameHelper.h
//  TileTest
//
//  Created by left199059 on 3/14/13.
//
//

#import <Foundation/Foundation.h>

@interface GameHelper : NSObject

+(CGPoint) locationFromTouch:(UITouch*)touch;

+(CGPoint) locationDeltaFromTouch:(UITouch*)touch;

@end
