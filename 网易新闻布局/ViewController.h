//
//  ViewController.h
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "UIViewController+UIViewController_IOS7Adapter.h"
@interface ViewController : UIViewController<LeftViewDisplayDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *leftView;


@end
