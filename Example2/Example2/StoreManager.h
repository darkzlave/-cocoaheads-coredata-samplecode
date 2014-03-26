//
//  StoreManager.h
//  Example2
//
//  Created by Phillipe Casorla on 3/2/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface StoreManager : NSObject
@property(nonatomic,strong) NSManagedObjectContext *managedObjectContext;


+(StoreManager*) sharedStoreManager;
- (void) saveContext;
@end
