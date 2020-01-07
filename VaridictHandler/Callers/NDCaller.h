//
//  NDCaller.h
//  VaridictHandler
//
//  Created by Nguyen Duc Hiep on 1/3/20.
//  Copyright © 2020 Neodata Co., Ltd. All rights reserved.
//

#import "Abstracts/NDCaller.h"

NS_ASSUME_NONNULL_BEGIN

@interface NDCaller : NSObject<NDCaller>

+ (instancetype _Nullable)callerWithHandler:(NDHandler _Nullable)handler;

@end

NS_ASSUME_NONNULL_END
