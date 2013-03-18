//
//  GameScene.m
//  TileTest
//
//  Created by left199059 on 3/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//



@implementation GameScene



+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
    layer.anchorPoint = CGPointMake(0, 0);
    BoundingLayer *camera = [BoundingLayer node];
    
    
    [camera setBound:[layer getMapSize]];
    [camera addChild:layer];
    UILayer *uiLayer = [UILayer node];
    
	// add layer as a child to scene
	[scene addChild: camera];
	[scene addChild: uiLayer];
    
    
	// return the scene
	return scene;
}

+(void) gameOver
{
    [[CCDirector sharedDirector] replaceScene:[TransitionScene sceneWithNextScene:nil]];
}

@end