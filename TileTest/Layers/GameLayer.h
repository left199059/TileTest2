

@interface GameLayer : MapLayer
{


    

}

//@property (nonatomic,retain) NSMutableArray*  enemies;

-(CGPoint) locationFromTilePos:(CGPoint) pos;

-(CGRect) getMapPixcelSize;


-(void) spawnEnemy;

@end
