//
//  NDCallerConsumerTests.m
//  VaridictHandlerTests
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "ConsumerTests.h"

#import "Callers/NDCaller.h"

@interface NDCallerConsumer : NSObject<Consumer>
@end

@implementation NDCallerConsumer {
  id<NDCaller> _caller;
}

- (NDHandler)handler {
  return _caller.handler;
}

- (void)setHandler:(NDHandler)handler {
  _caller = [NDCaller callerWithHandler:handler];
}

- (void)handle {
  [_caller setParameters:@[ self ]];
  [_caller call];
}

@end

@interface NDCallerConsumerTests : ConsumerTests

@end

@implementation NDCallerConsumerTests

- (id<Consumer>)buildConsumer {
  return [[NDCallerConsumer alloc] init];
}

@end
