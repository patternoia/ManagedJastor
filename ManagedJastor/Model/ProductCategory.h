//
//  ProductCategory.h
//  ManagedJastor
//
//  Created by Evgeny Lavrik on 11/28/12.
//  Copyright (c) 2012 Evgeny Lavrik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ManagedJastor.h"


@interface ProductCategory : ManagedJastor

@property (nonatomic, retain) NSString * name;

@end
