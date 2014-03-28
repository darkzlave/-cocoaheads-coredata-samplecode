//
//  FootballTeamDAO.m
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import "FootballTeamDAO.h"
@implementation FootballTeamDAO
-(NSArray*) listEntities{
    return [super listEntities:@"FootballTeam"];
}
-(FootballTeam*) newTeam{
    NSManagedObjectContext *context = [StoreManager sharedStoreManager].managedObjectContext;
    FootballTeam *team = (FootballTeam*)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([FootballTeam class]) inManagedObjectContext:context];
    int random = arc4random()%100;
    team.name = [@"Team " stringByAppendingFormat:@"%i",random];
    NSArray *country = @[@"England",@"Germany",@"Sweden",@"Italy",@"Spain"];
    int randomCountry = arc4random()%country.count;
    team.country = country[randomCountry];
    [self save];
    return team;
}`
-(FootballTeam*) gimmeRandomTeam{
    NSManagedObjectContext *context = [StoreManager sharedStoreManager].managedObjectContext;
    NSFetchRequest *myRequest = [[NSFetchRequest alloc] init];
    [myRequest setEntity: [NSEntityDescription entityForName:@"FootballTeam" inManagedObjectContext:context]];
    NSUInteger myEntityCount = [context countForFetchRequest:myRequest error:nil];
    
    NSUInteger offset = myEntityCount - (arc4random() % myEntityCount);
    [myRequest setFetchOffset:offset];
    [myRequest setFetchLimit:1];
    
    NSArray* objects = [context executeFetchRequest:myRequest error:nil];
    if (objects.count > 0) {
        return [objects objectAtIndex:0];
    }
    return  nil;
}
-(NSArray*) teamsPerCountry:(NSString*)country{
    NSManagedObjectContext *moc = [StoreManager sharedStoreManager].managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"FootballTeam"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(country CONTAINS[cd] %@) AND (players.@count > 0)", country];
    [request setPredicate:predicate];
    NSError *error = nil;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    int length = [array count];
    if (array != nil && length > 0)
    {
        return array;
    } else {
        return nil;
    }
}
@end
