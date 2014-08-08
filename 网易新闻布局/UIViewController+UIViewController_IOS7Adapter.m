//
//  UIViewController+UIViewController_IOS7Adapter.m
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "UIViewController+UIViewController_IOS7Adapter.h"

@implementation UIViewController (UIViewController_IOS7Adapter)
-(void)ios7Adapeter{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.view.bounds = CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height );
    }
}
@end
