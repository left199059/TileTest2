//
//  AIWalkingSprite.m
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "AIWalkingSprite.h"

@implementation AIWalkingSprite





-(id) initWithFile:(NSString *)filename andNav:(PathNav*) pathNav
{
	self = [super initWithFile:filename];
    if(self==nil)
        return nil;

    _pathNav = pathNav;
    

    return self;
}



+(id) spriteWithFile:(NSString *)filename andNav:(PathNav*) pathNav
{
    return [[[self alloc] initWithFile:filename andNav:pathNav]autorelease];
}



-(void)dealloc
{
    [_pathNav dealloc];
    [super dealloc];
}

-(void) start
{
    
    [self onArrived];
    self.visible = true;
    self.scale = 1;
    [self startAnimationRepeat:@"ZombieMove"  frameCount:6 delay:0.15 random:YES tag:101];
    
}


-(void) onArrived
{
    if(!self.visible)
        return ;
    
    
    CGPoint next = [_pathNav getNext:self.position];
    //ADD SOME COMMENTsss ssseee
    if(next.x==-1)
    {
        self.visible = false;
    }
    else{

        [self moveToPos:next];
    }
}






@end
