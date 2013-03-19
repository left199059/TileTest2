//
//  AIWalkingSprite.m
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "AIWalkingSprite.h"

@implementation AIWalkingSprite


PathNav* _pathNav;


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
    
   
    
}


-(void) onArrived
{
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
