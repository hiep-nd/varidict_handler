//
//  NDCaller0_1.mm
//  VaridictHandler
//
//  Created by Nguyen Duc Hiep on 1/3/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Callers/NDCaller0_1.h"

#import "Callers/Call.h"

using namespace Neodata::VaridictHandler;

@implementation NDCaller0_1 {
  id _para;
}

// MARK:- NDCaller

+ (BOOL)validate:(NDHandler)handler {
  static Validator validator(^void(id){
  });

  return validator.Validate(handler);
}

- (void)setParameters:(NSArray*)paras {
  _para = paras[0];
}

- (void)call {
  @try {
    Call(self.handler, _para);
  } @finally {
    _para = nil;
  }
}

@end
