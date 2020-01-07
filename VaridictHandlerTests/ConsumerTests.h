//
//  ConsumerTests.h
//  VaridictHandlerTests
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Abstracts/NDHandler.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Consumer<NSObject>

/**
 The type is void (^)() or void (^)(self).
 */
@property(nonatomic, copy) NDHandler handler;

- (void)handle;

@end

@interface ConsumerTests : XCTestCase

- (id<Consumer>)buildConsumer;

@end

NS_ASSUME_NONNULL_END
