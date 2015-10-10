//
//  RequestConfiguratorsAssembly.m
//  Conferences
//
//  Created by Egor Tolstoy on 04/10/15.
//  Copyright © 2015 Rambler. All rights reserved.
//

#import "RequestConfiguratorsAssembly.h"

#import "RESTRequestConfigurator.h"

static  NSString *const kConfigFileName  = @"Conferences.API.plist";
static  NSString *const kParseRootURLKey = @"API.Parse.RootURL";
static  NSString *const kParseRESTPathKey = @"API.Parse.RESTPath";

@implementation RequestConfiguratorsAssembly

#pragma mark - Option matcher

- (id<RequestConfigurator>)requestConfiguratorWithType:(NSNumber *)type {
    return [TyphoonDefinition withOption:type matcher:^(TyphoonOptionMatcher *matcher) {
        [matcher caseEqual:@(RequestConfigurationRESTType)
                       use:[self restRequestConfigurator]];
    }];
}

#pragma mark - Concrete definitions

- (id<RequestConfigurator>)restRequestConfigurator {
    return [TyphoonDefinition withClass:[RESTRequestConfigurator class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithBaseURL:apiPath:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(kParseRootURLKey)];
            [initializer injectParameterWith:TyphoonConfig(kParseRESTPathKey)];
        }];
    }];
}

#pragma mark - Config

- (id)configurer {
    return [TyphoonDefinition configDefinitionWithName:kConfigFileName];
}

@end