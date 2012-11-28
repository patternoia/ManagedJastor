//
//  Product.m
//  ManagedJastor
//
//  Created by Evgeny Lavrik on 11/28/12.
//  Copyright (c) 2012 Evgeny Lavrik. All rights reserved.
//

#import "Product.h"
#import "ProductCategory.h"


@implementation Product

@dynamic name;
@dynamic categories;

+ (Class)categories_class {
    return [ProductCategory class];
}

@end
