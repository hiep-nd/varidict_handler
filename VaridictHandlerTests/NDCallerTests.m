//
//  NDCallerTests.m
//  VaridictHandlerTests
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Callers/NDCaller.h"

@interface A : NSObject
@end

@implementation A

- (void)dealloc {
  NSLog(@"dealloc A");
}

@end

@interface NDCallerTests : XCTestCase
@end

@implementation NDCallerTests

- (void)test_init_nil {
  id<NDCaller> caller = [NDCaller callerWithHandler:nil];
  XCTAssertNil(caller);
}

- (void)test_init_0_0 {
  id<NDCaller> caller = [NDCaller callerWithHandler:^{
  }];
  XCTAssertNotNil(caller);
}

- (void)test_call_0_0 {
  __block BOOL b = NO;
  id<NDCaller> caller = [NDCaller callerWithHandler:^{
    b = YES;
  }];
  [caller call];
  XCTAssertTrue(b);
}

- (void)test_init_0_1 {
  id<NDCaller> caller = [NDCaller callerWithHandler:^{
  }];
  XCTAssertNotNil(caller);
}

- (void)test_call_0_1 {
  __block BOOL b = NO;
  id para = [[NSObject alloc] init];
  id<NDCaller> caller = [NDCaller callerWithHandler:^(id p) {
    XCTAssertEqual(para, p);
    b = YES;
  }];
  [caller setParameters:@[ para ]];
  [caller call];
  XCTAssertTrue(b);
}

- (void)test_call_1_0 {
  __weak A* rs = nil;
  @autoreleasepool {
    id<NDCaller> caller = [NDCaller callerWithHandler:^{
      return [A new];
    }];
    [caller call];

    rs = caller.result;
    XCTAssertNotNil(rs);
  }

  XCTAssertNil(rs);
}

@end
