//
//  EKPropertyHelper.h
//  EasyMappingExample
//
//  Created by Lucas Medeiros on 26/02/13.
//  Copyright (c) 2013 EasyKit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKPropertyHelper : NSObject

+ (BOOL)propertyNameIsScalar:(NSString *)propertyName fromObject:(id)object;

+ (id)propertyRepresentation:(NSArray *)array forObject:(id)object withPropertyName:(NSString *)propertyName;

@end
