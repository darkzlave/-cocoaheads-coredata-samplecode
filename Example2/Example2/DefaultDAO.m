//
//  DefaultDAO.m
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import "DefaultDAO.h"

@implementation DefaultDAO
+(id) buildDAO{
    return  [[self alloc] init];
}
-(void) save{
    
    [[StoreManager sharedStoreManager] saveContext];
}
-(NSArray*) listEntities:(NSString*)entityName{
    NSManagedObjectContext *moc = [StoreManager sharedStoreManager].managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
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
