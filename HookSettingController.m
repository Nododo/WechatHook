//
//  HookSettingController.m
//  hookDylib
//
//  Created by nododo on 2018/12/17.
//  Copyright © 2018 nododo. All rights reserved.
//

#import "HookSettingController.h"
#import <objc/runtime.h>
#import "CommonHeader.h"

@interface HookSettingController ()

@property (nonatomic, strong) MMTableViewInfo *mInfo;

@end

@implementation HookSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self makeData];
    
    UITableView *mainTable = [self.mInfo getTableView];
    [self.view addSubview:mainTable];
    [mainTable reloadData];
}

- (void)makeData {
    self.mInfo = [[objc_getClass("MMTableViewInfo") alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    [self.mInfo clearAllSection];
    
    MMTableViewSectionInfo *hookSection = [objc_getClass("MMTableViewSectionInfo") sectionInfoDefaut];
    
    BOOL redStatus = [HookManager readRedBagStatus];
    
    MMTableViewCellInfo *redBadCell = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(clickRed:) target:self title:@"开启抢红包" on:redStatus isFitIpadClassic:NO];
    
    [hookSection addCell:redBadCell];
    
    MMTableViewCellInfo *delayCell = [objc_getClass("MMTableViewCellInfo") editorCellForSel:@selector(editDelay:) target:self title:@"红包延时s" margin:100 tip:nil focus:NO text:nil isFitIpadClassic:NO];

    [hookSection addCell:delayCell];
    
    BOOL revokeStatus = [HookManager readRevokeStatus];
    
    MMTableViewCellInfo *revokeCell = [objc_getClass("MMTableViewCellInfo") switchCellForSel:@selector(clickRevoke:) target:self title:@"消息防撤回" on:revokeStatus isFitIpadClassic:NO];
    
    [hookSection addCell:revokeCell];
    
    [self.mInfo addSection:hookSection];
}

- (void)clickRed:(UISwitch *)sswitch {
    [HookManager saveRedBagStatus:sswitch.on];
}

- (void)clickRevoke:(UISwitch *)sswitch {
    [HookManager saveRevokeStatu:sswitch.on];
}

- (void)editDelay:(UITextField *)field {
    NSScanner* scan = [NSScanner scannerWithString:field.text];
    float val;
    if ([scan scanFloat:&val] && [scan isAtEnd]) {
        [HookManager saveDelaySeconds:field.text.floatValue];
    }
}
@end
