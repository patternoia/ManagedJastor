//
//  ManagedJastorTests.m
//  ManagedJastorTests
//
//  Created by Evgeny Lavrik on 11/28/12.
//  Copyright (c) 2012 Evgeny Lavrik. All rights reserved.
//

#import "ManagedJastorTests.h"
#import "Product.h"
#import "AppDelegate.h"

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
    NSError *error = nil;
    
    NSManagedObjectContext *moc = ((AppDelegate*) [[UIApplication sharedApplication] delegate]).managedObjectContext;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:moc];
    
    Product *managedObject = (Product*) [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:moc];
    [managedObject initializeFieldsWithDictionary:json];
    
    STAssertTrue([managedObject.name isEqualToString:@"Foo"], @"Check product name");
    STAssertTrue([[[managedObject.categories anyObject] name] rangeOfString:@"Bar Category"].location != NSNotFound, @"Check object cagegory name");
    
    if (![moc save:&error])
        NSLog(@"Error");
}

@end
