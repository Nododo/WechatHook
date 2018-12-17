//
//  HookManager.m
//  hookDylib
//
//  Created by nododo on 2018/12/17.
//  Copyright © 2018 nododo. All rights reserved.
//

#import "HookManager.h"
static NSString * const HookRedBagOpen = @"HookRedBagOpen";
static NSString * const HookRedBagDelay = @"HookRedBagDelay";
static NSString * const HookRevokeOpen = @"HookRevokeOpen";

@implementation HookManager

+ (BOOL)readRedBagStatus {
   return [[NSUserDefaults standardUserDefaults] boolForKey:HookRedBagOpen];
}

+ (void)saveRedBagStatus:(BOOL)isOpen {
    [[NSUserDefaults standardUserDefaults] setBool:isOpen forKey:HookRedBagOpen];
}

+ (float)readDelaySeconds {
    return [[NSUserDefaults standardUserDefaults] floatForKey:HookRedBagDelay];
}
+ (void)saveDelaySeconds:(float)delaySeconds {
    [[NSUserDefaults standardUserDefaults] setFloat:delaySeconds forKey:HookRedBagDelay];
}

+ (BOOL)readRevokeStatus {
    return [[NSUserDefaults standardUserDefaults] boolForKey:HookRevokeOpen];

}

+ (void)saveRevokeStatu:(BOOL)isOpen {
    [[NSUserDefaults standardUserDefaults] setBool:isOpen forKey:HookRevokeOpen];
}
@end
