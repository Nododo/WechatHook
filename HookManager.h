//
//  HookManager.h
//  hookDylib
//
//  Created by nododo on 2018/12/17.
//  Copyright © 2018 nododo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HookManager : NSObject

+ (BOOL)readRedBagStatus;
+ (void)saveRedBagStatus:(BOOL)isOpen;
+ (float)readDelaySeconds;
+ (void)saveDelaySeconds:(float)delaySeconds;
+ (BOOL)readRevokeStatus;
+ (void)saveRevokeStatu:(BOOL)isOpen;
@end

NS_ASSUME_NONNULL_END
