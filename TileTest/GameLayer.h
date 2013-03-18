

@interface GameLayer : MapLayer
{


    

}

//@property (nonatomic,retain) NSMutableArray*  enemies;

-(CGPoint) locationFromTilePos:(CGPoint) pos;

-(CGRect) getMapSize;


-(void) spawnEnemy;

@end
