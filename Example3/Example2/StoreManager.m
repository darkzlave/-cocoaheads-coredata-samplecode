//
//  StoreManager.m
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import "StoreManager.h"

@interface StoreManager()

@property(nonatomic,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(nonatomic,strong) NSManagedObjectModel *managedObjectModel;
@end

@implementation StoreManager

#pragma mark - Singleton stuff
+(StoreManager*) sharedStoreManager
{
    static StoreManager *_sharedStore = nil;
    static dispatch_once_t onceToken;
    //thread-safe way to create a singleton
    dispatch_once(&onceToken, ^{
        _sharedStore = [[StoreManager allocWithZone:nil] init];
    });
    
    return _sharedStore;
}

- (id) init{
    if (self = [super init]) {
        [self buildContexts];
        if (!_managedObjectContext) {
            // Handle the error.
            NSLog(@"Unresolved error (no context)");
            exit(-1);  // Fail
        }
    }
    return self;
}

#pragma mark - Context
-(void) buildContexts{
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        
        self.managedObjectContext = [[NSManagedObjectContext alloc] init];//concurrency type
        [self.managedObjectContext setPersistentStoreCoordinator:_persistentStoreCoordinator];
        [self.managedObjectContext setUndoManager:nil];
    }
}

- (NSManagedObjectModel *)managedObjectModel {
	
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"StoreModel" withExtension:@"momd"];
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
	
	NSError *error;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"Example.sqlite"]];
    //options for auto migrate
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption : [NSNumber numberWithBool:YES],
                              NSInferMappingModelAutomaticallyOption :[NSNumber numberWithBool:YES],
                              NSSQLitePragmasOption:@{@"synchronous": @"OFF"}
                              };
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error]) {
        // Handle the error.
        NSLog(@"Unresolved persistent error %@, %@", error, [error userInfo]);
        exit(-1);  // Fail
    }
	
    return _persistentStoreCoordinator;
}


/**
 Performs the save action for the application, which is to send the save:
 message to the application's managed object context.
 */
-(void) saveContext{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


#pragma mark -
#pragma mark Application's documents directory

/**
 Returns the path to the application's documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}


-(void) dealloc{
    
    _managedObjectContext = nil;
    _managedObjectModel = nil;
    _persistentStoreCoordinator = nil;
}
@end
