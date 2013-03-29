//
//  BMWDataManager.m
//  MapNotes2
//
//  Created by Benjamin Wang on 3/24/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWDataManager.h"
#import <CoreData/CoreData.h>

#define kBMWEntityName @"BMWNote"
#define kBMWLocation @"BMWLocation"
#define kBMWSaveError @"Ahhh, couldn't save: %@"

@interface BMWDataManager ()
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end

@implementation BMWDataManager

 - (BOOL)addNoteContentWithDate:(NSDate *)date Title:(NSString *)titleText Detail:(NSString *)details Coordinate:(CLLocationCoordinate2D) coordinate
{
    NSManagedObjectContext *context = [self managedObjectContext];
    BMWNote *note = [NSEntityDescription insertNewObjectForEntityForName:kBMWEntityName inManagedObjectContext:context];
    BMWLocation *location = [NSEntityDescription insertNewObjectForEntityForName:kBMWLocation inManagedObjectContext:context];
    
    //Setting datapoints
    note.date = date;
    note.titleString = titleText;
    note.detailString = details;
    
    location.lat = coordinate.latitude;
    location.lon = coordinate.longitude;
    note.location = location;
    NSError *error;
    if (![context save:&error]) {
        NSLog(kBMWSaveError, [error localizedDescription]);
        return NO;
    }
    return YES;
}

- (NSArray *)getAllNotes
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:kBMWEntityName inManagedObjectContext:context];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"date" ascending:NO];
    [fetchRequest setSortDescriptors:@[sort]];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects;
}

- (BOOL)deleteNote:(BMWNote *)note
{
    NSManagedObjectContext *context = [self managedObjectContext];
    [context deleteObject:note];
    NSError *error;
    if (![context save:&error]) {
        NSLog(kBMWSaveError, [error localizedDescription]);
        return NO;
    }
    return YES;
}

//In the future, I may want to modify this to allow for edits
- (BOOL)updateNote:(BMWNote *)note Location:(BMWLocation *)location WithDate:(NSDate *)date Title:(NSString *)titleText Detail:(NSString *)details Coordinate:(CLLocationCoordinate2D)coordinate
{
    NSManagedObjectContext *context = [self managedObjectContext];
    note.date = date;
    note.titleString = titleText;
    note.detailString = details;
    location.lat = coordinate.latitude;
    location.lon = coordinate.longitude;
    NSError *error;
    if (![context save:&error]) {
        NSLog(kBMWSaveError, [error localizedDescription]);
        return NO;
    }
    return YES;
}

- (BOOL)deleteAllNotes
{
    NSArray *allNotes = [self getAllNotes];
    for (BMWNote *note in allNotes) {
        if (![self deleteNote:note]) {
            return NO;
        }
    }
    return YES;
}

- (NSArray *)searchNote:(NSString *)text
{
    //will get to this if I have time
    NSArray *searchedNotes;
    return searchedNotes;
}


#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    //what is this???????????  "withExtension??"
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"BMWNote.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end

