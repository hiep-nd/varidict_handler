//
//  Call.h
//  VaridictHandler
//
//  Created by Nguyen Duc Hiep on 1/6/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Abstracts/NDHandler.h"

#if !defined(__cplusplus)
#error "This file requires C++ support."
#endif

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

@class CTBlockDescription;

namespace Neodata {
namespace VaridictHandler {
template <typename T, typename... Args>
inline T Call(NDHandler handler, Args... args) {
  return handler ? ((T (^)(...))handler)(args...) : T();
}

template <typename... Args>
inline void Call(NDHandler handler, Args... args) {
  Call<void>(handler, args...);
}

class Validator {
 private:
  CTBlockDescription* _des;

 public:
  Validator(NDHandler sample);
  bool Validate(NDHandler handler) const;
  bool ValidateVaridict(NDHandler handler) const;
};
}
}
