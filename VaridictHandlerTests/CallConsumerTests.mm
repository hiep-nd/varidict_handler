//
//  CallConsumerTests.m
//  VaridictHandlerTests
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "ConsumerTests.h"

#import "Callers/Call.h"

using namespace Neodata::VaridictHandler;

@interface CallConsumer : NSObject<Consumer>
@end

@implementation CallConsumer

@synthesize handler = _handler;

- (void)setHandler:(NDHandler)handler {
  static Validator validator(^(id){
  });
  _handler = validator.ValidateVaridict(handler) ? [handler copy] : nil;
}

- (void)handle {
  Call(self.handler, self);
}

@end

@interface CallConsumerTests : ConsumerTests
@end

@implementation CallConsumerTests

- (id<Consumer>)buildConsumer {
  return [[CallConsumer alloc] init];
}

@end
