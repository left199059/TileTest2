//
//  AIWalkingSprite.m
//  TileTest
//
//  Created by left199059 on 3/16/13.
//
//

#import "AIWalkingSprite.h"

@implementation AIWalkingSprite


PathNav* pathNav;
MapLayer* _map;

-(id) initWithFile:(NSString *)filename
{
	self = [super initWithFile:filename];
    if(self==nil)
        return nil;
    
    _map = (MapLayer*)self.parent;
    pathNav = [[PointPathNav alloc] initWithMap:_map];
    
    CGPoint next = [pathNav getNext:self.position];
    
    return self;
}

-(void)dealloc
{
    [pathNav dealloc];
     [super dealloc];
}

-(void) start
{
    
    [self onArrived];
    
   
    
}


-(void) onArrived
{
    CGPoint next = [pathNav getNext:self.position];
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
