
@implementation GameLayer


//@synthesize enemies = s_;

NSMutableArray* _enemies;
WalkingSprite* _hero;

InputHelper* input;
bool moved;
CCRibbon* ribbon;
int _enemyCount=15;
int nextSpawnTime = 0;
int spawnTimeContant = 20;
int spawnTimeRnd = 80;



-(void) dealloc
{
    [_enemies dealloc];
    _enemies = nil;
    
    [super dealloc];
}

-(id) init
{
	self = [super initWithTMX:@"map.tmx" AndMap:@"map.png" ];
    
	if(self==nil)
        return nil;
    
    
    //add enemies
    _enemies = [[NSMutableArray alloc ] init];
   
    //all paths layer names
    NSMutableArray* paths = [NSMutableArray array];
    [paths addObject: @"PathLayer"];
    
    for(int i =0;i<_enemyCount;i++)
    {
        int index = rand()% [paths count];
        NSString* pathLayer = [paths objectAtIndex:index];
        
        PointPathNav* pathNav = [[PointPathNav alloc] initWithMap:self  andLayer:pathLayer];
        
        AIWalkingSprite* _enemy = [AIWalkingSprite spriteWithFile:@"enemy.png" andNav:pathNav];
        [self addChild:_enemy];
        [_enemies addObject:_enemy];
        
        _enemy.visible = false;

    }
    
    //add hero
    _hero = [WalkingSprite spriteWithFile:@"enemy.png"];
    CGPoint startPoint =  [self locationFromTilePos: ccp(16,27)];
    _hero.position = startPoint;
    [self addChild:_hero];
    

    self.isTouchEnabled = true;
	
    [self unscheduleUpdate];    [self scheduleUpdate];
    
    

    
	return self;
}

-(void) spawnEnemy
{
    for(AIWalkingSprite* enemy in _enemies)
    {
        if(enemy.visible)
            continue;
        
        
        CGPoint startPoint =  [self locationFromTilePos: ccp(16,27)];
        enemy.position = startPoint;
        [enemy start];
        enemy.visible = true;
        
        break;
    }
}



-(CGRect) getMapSize
{
    CGRect rect;
    
    rect.size = mapSize;
    
    return rect;
}

-(void) update:(ccTime) delta
{
    [super update:delta];
 
    
    nextSpawnTime--;
    if(nextSpawnTime<=0)
    {
        nextSpawnTime = spawnTimeContant+rand()%spawnTimeRnd;
        [self spawnEnemy];
    }
    
    for(AIWalkingSprite* enemy in _enemies)
    {
        if(enemy.visible)
            [enemy update:delta];
    }
    
}

-(void)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    moved = false;
}


-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    moved = true;
//    CGPoint touchPos = [self locationInParent:[GameHelper locationFromTouch:[touches anyObject]]];
//    [ribbon addPointAt:touchPos width:20];
}




-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if(!moved)
    {
        //pos
        CGPoint touchPos = [self locationInParent:[GameHelper locationFromTouch:[touches anyObject]]];
        
        CGPoint pos = touchPos;
        
        //get tile index
        pos = [self tilePosFromLocation:pos];
        
        //is Path?
        bool isHeroPath = [self tileHasKey:@"isHeroPath" AtPoint:pos inLayer:@"HeroPathLayer"];
        
        
        if(isHeroPath)
        {
            [_hero moveToPos:touchPos];
        }
        
    }
    
    moved = false;
    
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
   
}

@end
