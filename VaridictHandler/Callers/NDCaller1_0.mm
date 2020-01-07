//
//  NDCaller1_0.m
//  VaridictHandler
//
//  Created by Nguyen Duc Hiep on 1/5/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Callers/NDCaller1_0.h"

#import "Callers/Call.h"

using namespace Neodata::VaridictHandler;

@implementation NDCaller1_0 {
  id _result;
}

// MARK:- NDCaller

+ (BOOL)validate:(NDHandler)handler {
  static Validator validator(^id() {
    return nil;
  });

  return validator.Validate(handler);
}

- (void)call {
  _result = Call<id>(self.handler);
}

- (id)result {
  @try {
    return _result;
  } @finally {
    _result = nil;
  }
}

@end
