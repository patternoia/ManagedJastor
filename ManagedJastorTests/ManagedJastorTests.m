//
//  ManagedJastorTests.m
//  ManagedJastorTests
//
//  Created by Evgeny Lavrik on 11/28/12.
//  Copyright (c) 2012 Evgeny Lavrik. All rights reserved.
//

#import "ManagedJastorTests.h"
#import "Product.h"

@implementation ManagedJastorTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Product" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ManagedJastor" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSURL *storeURL = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"ManagedJastor.sqlite"];
    
    NSError *error = nil;
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] init];
    [moc setPersistentStoreCoordinator:persistentStoreCoordinator];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:moc];
    
    Product *managedObject = (Product*) [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:moc];
    [managedObject initializeFieldsWithDictionary:json];
    
    STAssertTrue([managedObject.name isEqualToString:@"Foo"], @"Check product name");
    STAssertTrue([[[managedObject.categories anyObject] name] rangeOfString:@"Bar Category"].location != NSNotFound, @"Check object cagegory name");
}

@end
