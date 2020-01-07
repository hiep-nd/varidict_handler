//
//  CallTests.mm
//  VaridictHandlerTests
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Callers/Call.h"

using namespace Neodata::VaridictHandler;

@interface CallTests : XCTestCase
@end

@implementation CallTests

- (void)test_Call_handler0_0 {
  __block auto called = NO;
  NDHandler handler = ^{
    called = YES;
  };

  Call<void>(handler);
  XCTAssertTrue(called);
}

- (void)test_Call_handler1_0 {
  NDHandler handler = ^int {
    return 100;
  };

  auto rs = Call<int>(handler);
  XCTAssertEqual(100, rs);
}

- (void)test_Call_handler0_1 {
  __block auto called = NO;
  NDHandler handler = ^(id p0, id p1, BOOL p2) {
    XCTAssertEqualObjects(@"1", p0);
    XCTAssertEqualObjects(@"2", p1);
    XCTAssertEqual(YES, p2);
    called = YES;
  };

  Call(handler, @"1", @"2", YES);

  XCTAssertTrue(called);
}

- (void)test_Validator_Validate_0_0 {
  Validator v(^{
  });

  XCTAssertTrue(v.Validate(^{
  }));

  XCTAssertFalse(v.Validate(^{
    return 1;
  }));

  XCTAssertFalse(v.Validate(^(int){
  }));
}

- (void)test_Validator_ValidateVaridict_0_2 {
  Validator v(^(int, id){
  });

  XCTAssertTrue(v.ValidateVaridict(^{
  }));

  XCTAssertTrue(v.ValidateVaridict(^id {
    return nil;
  }));

  XCTAssertTrue(v.ValidateVaridict(^(int){
  }));

  XCTAssertTrue(v.ValidateVaridict(^(int, id){
  }));

  XCTAssertFalse(v.ValidateVaridict(^(int, id, int){
  }));

  XCTAssertFalse(v.ValidateVaridict(^(id){
  }));

  XCTAssertFalse(v.ValidateVaridict(^(id, int){
  }));
}

@end
