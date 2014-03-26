//
//  MasterViewController.h
//  Example1
//
//  Created by Phillipe Casorla on 3/1/14.
//  Copyright (c) 2014 Shape Up Club. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
