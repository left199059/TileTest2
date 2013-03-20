


@implementation GameLayer


//@synthesize enemies = s_;

NSMutableArray* _enemies;
WalkingSprite* _hero;

InputHelper* input;
bool moved;
CCRibbon* ribbon;
int _enemyCount=1;
int nextSpawnTime = 0;
int spawnTimeContant = 30;
int spawnTimeRnd = 50;



-(void) dealloc
{
    [_enemies dealloc];
    _enemies = nil;
    
    [super dealloc];
}

-(id) init
{
	self = [super initWithTMX:@"ZombieMoveMapwithPath.tmx" AndMap:@"ZombieMoveMap1.png" ];
    
	if(self==nil)
        return nil;
    
    
    //add enemies
    _enemies = [[NSMutableArray alloc ] init];
   
    //all paths layer names
    NSMutableArray* paths = [NSMutableArray array];
    
    
    NSString* name;
    
    for(int i=1;i<=8;i++)
    {
        
        name = [NSString stringWithFormat:@"PATH%i",i];

        [paths addObject: name];
    }

    
    
    
    for(int i =0;i<_enemyCount;i++)
    {
        int index = rand()% [paths count];
        NSString* pathLayer = [paths objectAtIndex:index];
        pathLayer = [NSString stringWithString:pathLayer];
        PointPathNav* pathNav = [[PointPathNav alloc] initWithMap:self  andLayer:pathLayer];
        
        AIWalkingSprite* _enemy = [AIWalkingSprite spriteWithFile:@"HeroArcherMove0.png" andNav:pathNav];
        
        
        
       
        [self addChild:_enemy];
        [_enemies addObject:_enemy];
        
        _enemy.visible = false;
     
        _enemy->speed = 0.03f;

    }
    
    //add hero
    _hero = [WalkingSprite spriteWithFile:@"enemy.png"];
    CGPoint startPoint =  [self locationFromTilePos: ccp(16,27)];
    _hero.position = startPoint;
    [self addChild:_hero];
    

    self.isTouchEnabled = true;
	
    [self unscheduleUpdate];
    [self scheduleUpdate];
    
    

    
	return self;
}

-(void) spawnEnemy
{
    for(AIWalkingSprite* enemy in _enemies)
    {
        if(enemy.visible)
            continue;
        
        PointPathNav* nav = (PointPathNav*) enemy->_pathNav;
        CGPoint startPoint = [nav getFirst];
        startPoint =  [self locationFromTilePos: startPoint];
        enemy->health = 30;
        enemy.position = startPoint;
        
        enemy.visible = true;
        [enemy start];
        
        break;
    }
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
    
    for(AIWalkingSprite* enemy in _enemies)
    {
        if(!enemy.visible)
            continue;
        
        [enemy damage:10];
    }
}

@end
