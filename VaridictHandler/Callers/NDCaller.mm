//
//  NDCaller.mm
//  VaridictHandler
//
//  Created by Nguyen Duc Hiep on 1/3/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Callers/NDCaller.h"

#import "Callers/NDCaller0_0.h"
#import "Callers/NDCaller0_1.h"
#import "Callers/NDCaller1_0.h"

@implementation NDCaller

+ (instancetype)callerWithHandler:(NDHandler)handler {
  if (!handler) {
    return nil;
  }

  static auto classes =
      @[ NDCaller0_0.class, NDCaller0_1.class, NDCaller1_0.class ];
  for (Class c in classes) {
    if ([c validate:handler]) {
      id<NDCaller> caller = [[c alloc] init];
      caller.handler = handler;
      return caller;
    }
  }
  
  return nil;
}

// MARK:- NDCaller

@synthesize handler;

- (void)call {
}

- (void)setParameters:(NSArray*)paras {
}

- (id)result {
  return nil;
}

+ (BOOL)validate:(NDHandler)handler {
  return NO;
}

@end
