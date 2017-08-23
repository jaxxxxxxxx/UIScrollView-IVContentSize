//
//  UIScrollView+IVContentSize.m
//  NBD2
//
//  Created by IV on 2017/8/22.
//  Copyright © 2017年 IV. All rights reserved.
//

#import "UIScrollView+IVContentSize.h"
#import <objc/runtime.h>

@implementation UIScrollView (IVContentSize)
+ (void)load {
    Method originalMethod = class_getInstanceMethod(self, @selector(setContentSize:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(iv_setContentSize:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

#pragma mark - hook
- (void)iv_setContentSize:(CGSize)contentSize {
    if (self.iv_autoContentSize) {
        UIView *view = [self viewWithTag:self.iv_promptViewTag];
        
        if (view && !view.isHidden) {
            CGSize size = CGSizeMake(CGRectGetWidth(self.frame),
                                     CGRectGetMaxY(view.frame) + self.iv_bottomPadding);
            contentSize = size;
        }
    }
    [self iv_setContentSize:contentSize];
}


#pragma mark setter & getter
- (BOOL)iv_autoContentSize {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIv_autoContentSize:(BOOL)iv_autoContentSize {
    objc_setAssociatedObject(self,
                             @selector(iv_autoContentSize),
                             @(iv_autoContentSize),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)iv_bottomPadding {
    NSInteger bottomPadding = [objc_getAssociatedObject(self, _cmd) integerValue];
    //未设置返回缺省值 PromptView_Bottom
    if (bottomPadding == 0)
        return PromptView_Bottom;
    return bottomPadding;
}

- (void)setIv_bottomPadding:(NSInteger)iv_bottomPadding {
    objc_setAssociatedObject(self,
                             @selector(iv_bottomPadding),
                             @(iv_bottomPadding),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)iv_promptViewTag {
    NSInteger promptViewTag = [objc_getAssociatedObject(self, _cmd) integerValue];
    //未设置返回缺省值 PromptView_Tag
    if (promptViewTag == 0)
        return PromptView_Tag;
    return promptViewTag;
}

- (void)setIv_promptViewTag:(NSInteger)iv_promptViewTag {
    objc_setAssociatedObject(self,
                             @selector(iv_promptViewTag),
                             @(iv_promptViewTag),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
