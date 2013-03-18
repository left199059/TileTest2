//
//  UILayer.m
//  TileTest
//
//  Created by left199059 on 3/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//



@implementation UILayer


-(id) init
{
	if ((self=[super init])==nil)
        return nil;
    
    CCLabelBMFont* label = [CCLabelBMFont labelWithString:@"1123" fntFile:@"bitmapfont.fnt"];
    
    [self addChild:label];
    glClearColor(1, 1,1, 1);
    
    TowerSprite* tower1 = [TowerSprite spriteWithFile:@"1.png"];
    tower1.position = ccp(50,80);
    [self addChild:tower1];
    
    
    return self;
}


@end
