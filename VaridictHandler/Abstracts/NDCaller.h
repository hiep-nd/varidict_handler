//
//  NDCaller.h
//  Mode-View-ViewModel-ObjC
//
//  Created by Nguyen Duc Hiep on 1/3/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Abstracts/NDHandler.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NDCaller<NSObject>

+ (BOOL)validate:(NDHandler _Nullable)handler;
@property(nonatomic, copy) NDHandler handler;
- (void)setParameters:(NSArray*)paras;
- (void)call;
- (id _Nullable)result;

@end

NS_ASSUME_NONNULL_END
