//
//  ConsumerTests.m
//  VaridictHandlerTests
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "ConsumerTests.h"

@implementation ConsumerTests

- (id<Consumer>)buildConsumer {
  return nil;
}

- (void)test_0_0 {
  id<Consumer> consumer = [self buildConsumer];
  __block BOOL called = NO;
  consumer.handler = ^{
    called = YES;
  };
  [consumer handle];
  XCTAssertTrue(called);
}

- (void)test_0_1 {
  id<Consumer> consumer = [self buildConsumer];
  __block BOOL called = NO;
  __weak id<Consumer> weakConsumer = consumer;
  consumer.handler = ^(id<Consumer> c) {
    XCTAssertEqual(c, weakConsumer);
    called = YES;
  };
  [consumer handle];
  XCTAssertTrue(called);
}

@end
