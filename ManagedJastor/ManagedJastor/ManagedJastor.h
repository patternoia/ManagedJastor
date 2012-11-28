//
//  ManagedJastor.h
//  ManagedJastor
//
//  Jastor Created by Elad Ossadon on 12/14/11.
//  http://devign.me | http://elad.ossadon.com | http://twitter.com/elado
//
//  Adopted to ManagedObjects by Evgeny Lavrik 11/28/12

#import <CoreData/CoreData.h>

@interface ManagedJastor : NSManagedObject <NSCoding>

- (void)initializeFieldsWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, retain) NSString *objectId;

@end
