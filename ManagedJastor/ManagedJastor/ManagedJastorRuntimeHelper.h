@interface ManagedJastorRuntimeHelper : NSObject {
	
}

+ (Class)propertyClassForPropertyName:(NSString *)propertyName ofClass:(Class)klass;
+ (NSArray *)propertyNames:(Class)klass;

@end
