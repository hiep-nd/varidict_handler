//
//  Call.m
//  VaridictHandler
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Callers/Call.h"

#import "CTObjectiveCRuntimeAdditions/CTBlockDescription.h"

namespace {
inline bool IsEqualTypes(const char* encodeType1, const char* encodeType2) {
  if (!encodeType1 || !encodeType2) {
    return false;
  }

  auto signature1 = [NSMethodSignature signatureWithObjCTypes:encodeType1];
  auto signature2 = [NSMethodSignature signatureWithObjCTypes:encodeType2];
  return [signature1 isEqual:signature2];
}
}

namespace Neodata {
namespace VaridictHandler {
Validator::Validator(NDHandler sample) {
  _des = sample ? [[CTBlockDescription alloc] initWithBlock:sample] : nil;
}

bool Validator::Validate(NDHandler handler) const {
  return handler ? [[[CTBlockDescription alloc] initWithBlock:handler]
                           .blockSignature isEqual:_des.blockSignature]
                 : false;
}

bool Validator::ValidateVaridict(NDHandler handler) const {
  if (!handler) {
    return false;
  }

  auto des = [[CTBlockDescription alloc] initWithBlock:handler];
  auto _rt = _des.blockSignature.methodReturnType;
  if (!IsEqualTypes(_rt, @encode(void)) &&
      !IsEqualTypes(des.blockSignature.methodReturnType, _rt)) {
    return false;
  }

  auto noa = des.blockSignature.numberOfArguments;
  if (noa > _des.blockSignature.numberOfArguments) {
    return false;
  }

  for (int i = 0; i < noa; i++) {
    if (!IsEqualTypes([des.blockSignature getArgumentTypeAtIndex:i],
                      [_des.blockSignature getArgumentTypeAtIndex:i])) {
      return false;
    }
  }

  return true;
}
}
}
