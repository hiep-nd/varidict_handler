//
//  NDCaller0_0.mm
//  VaridictHandler
//
//  Created by Nguyen Duc Hiep on 1/3/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Callers/NDCaller0_0.h"

#import "Callers/Call.h"

using namespace Neodata::VaridictHandler;

@implementation NDCaller0_0

// MARK:- NDCaller

+ (BOOL)validate:(NDHandler)handler {
  static Validator validator(^void(){
  });
  return validator.Validate(handler);
}

- (void)call {
  Call(self.handler);
}

@end
