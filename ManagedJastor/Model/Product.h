//
//  Product.h
//  ManagedJastor
//
//  Created by Evgeny Lavrik on 11/28/12.
//  Copyright (c) 2012 Evgeny Lavrik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ManagedJastor.h"

@class ProductCategory;

@interface Product : ManagedJastor

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *categories;
@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(ProductCategory *)value;
- (void)removeCategoriesObject:(ProductCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

@end
