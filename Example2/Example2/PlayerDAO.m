//
//  PlayerDAO.m
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import "PlayerDAO.h"
#import "FootballTeamDAO.h"
@implementation PlayerDAO
-(NSArray*) listEntities{
    return [super listEntities:@"Player"];
}
-(Player*) newPlayer{
    FootballTeamDAO *teamDAO = [FootballTeamDAO buildDAO];
    int randomName = arc4random()%100;
    int randomSkill = arc4random()%100;
    NSManagedObjectContext *context = [StoreManager sharedStoreManager].managedObjectContext;
    Player *player = (Player*)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Player class]) inManagedObjectContext:context];
    FootballTeam *team = [teamDAO gimmeRandomTeam];
    player.team = team;
    player.name = [@"Player " stringByAppendingFormat:@"%i",randomName];
    player.skill = randomSkill;
    [self save];
    return player;
}
@end
