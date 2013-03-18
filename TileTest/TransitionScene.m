//
//  TransitionScene.m
//  TileTest
//
//  Created by left199059 on 3/15/13.
//
//

#import "TransitionScene.h"

@implementation TransitionScene

CCScene* _scene;



-(id) initWithNextScene:(CCScene*)scene
{
    self = [super init];
    if(self==nil)
        return nil;
    
    _scene = scene;
    
    CCLabelTTF* label = [CCLabelTTF labelWithString:@"test" fontName:@"Arial" fontSize:50];
    
    [self addChild:label];
    
    [self scheduleUpdate];
    
    return self;
}

+(id) sceneWithNextScene:(CCScene*)scene
{
    return [[[self alloc] initWithNextScene:scene]autorelease];
}


-(void) update:(ccTime) delta
{
    [self unscheduleUpdate];
    
    CCTransitionFade* fade = [CCTransitionFade transitionWithDuration:1 scene:[GameScene scene]];
    [[CCDirector sharedDirector] replaceScene:fade];
}

@end
