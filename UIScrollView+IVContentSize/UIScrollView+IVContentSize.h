//
//  UIScrollView+IVContentSize.h
//  NBD2
//
//  Created by IV on 2017/8/22.
//  Copyright © 2017年 IV. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PromptView_Tag 10000
#define PromptView_Bottom 100

@interface UIScrollView (IVContentSize)

/**
 是否自动调整contentSize
 */
@property (assign, nonatomic) BOOL iv_autoContentSize;


/**
 promptView到底的距离 default:PromptView_Bottom
 */
@property (assign, nonatomic) NSInteger iv_bottomPadding;


/**
 promptViewTag default:PromptView_Tag
 */
@property (assign, nonatomic) NSInteger iv_promptViewTag;

@end
