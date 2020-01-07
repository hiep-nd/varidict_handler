# Varidict Handler
A ObjC helper to use varidict handler.
And one line of code is worth a thousand words.
```objectivec
@interface Consumer
/**
 The type is void (^)() or void (^)(id self).
 */
@property(nonatomic, copy) NDHandler handler;

- (void)handle;

@end

```
The implemntation, for ObjC++ fan

```objectivec
// For ObjC++

using namespace Neodata::VaridictHandler;

@implementation Consumer

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

```
and for natural ObjC fan
```objectivec
// For ObjC

@implementation Consumer {
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

```
Now we can use:
```objectivec
/// Consumer* consumer;
consumer.handler = ^{ /* Do somethings */ };

// or
consumer.handler = ^(id consumer){ /* Do somethings with consumer as parameter */ };

// or
consumer.handler = ^BOOL(id consumer){ 
/* 
  Do somethings with consumer as parameter and return,
  but no ones care about the return value.
 */ 
	return YES;
};

```