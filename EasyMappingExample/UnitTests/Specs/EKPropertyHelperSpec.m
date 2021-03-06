//
//  EKPropertyHelperSpec.m
//  EasyMappingExample
//
//  Created by Andrew Romanov on 27.03.14.
//  Copyright (c) 2014 EasyKit. All rights reserved.
//

#import "Kiwi.h"
#import "CMFactory.h"
#import "EKPropertyHelper.h"
#import "EasyMapping.h"
#import "Native.h"
#import "CMFixture.h"
#import "MappingProvider.h"


SPEC_BEGIN(EKPropertyHelperSpec)

describe(@"EKPropertyHelper", ^{
	context(@"native properties", ^{
		__block Native *native;
		beforeEach(^{
			NSDictionary *externalRepresentation = [CMFixture buildUsingFixture:@"Native"];
			native = [EKMapper objectFromExternalRepresentation:externalRepresentation withMapping:[MappingProvider nativeMapping]];
		});
		
		context(@"detect native properties", ^{
			specify(^{
				EKObjectMapping* mapping = [MappingProvider nativeMapping];
				[mapping.fieldMappings enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
					EKFieldMapping* fieldMapping = obj;
					[[@([EKPropertyHelper propertyNameIsScalar:fieldMapping.field fromObject:native]) should] equal:@(YES)];
				}];
			});
			specify(^{
				[[@([EKPropertyHelper propertyNameIsScalar:@"boolProperty" fromObject:native]) should] equal:@(YES)];
			});
		});
	});
});

SPEC_END