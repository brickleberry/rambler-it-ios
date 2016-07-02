// Copyright (c) 2015 RAMBLER&Co
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <XCTest/XCTest.h>
#import <EasyMapping/EasyMapping.h>

#import "ManagedObjectMappingProvider.h"
#import "SocialNetworkAccountManagedObject.h"

@interface RCFManagedObjectMappingProviderTests : XCTestCase

@property (strong, nonatomic) ManagedObjectMappingProvider *provider;

@end

@implementation RCFManagedObjectMappingProviderTests

- (void)setUp {
    [super setUp];
    
    self.provider = [[ManagedObjectMappingProvider alloc] init];
}

- (void)tearDown {
    self.provider = nil;
    
    [super tearDown];
}

- (void)testThatProviderReturnsProperMappingForOneOfModels {
    // given
    Class targetClass = [SocialNetworkAccountManagedObject class];
    NSString *const kExpectedEntityName = NSStringFromClass(targetClass);
    
    // when
    EKManagedObjectMapping *mapping = [self.provider mappingForManagedObjectModelClass:targetClass];
    
    // then
    XCTAssertEqualObjects(mapping.entityName, kExpectedEntityName);
}

@end
