//
//  LeftViewController.h
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftCellModel.h"
#import "UIViewController+UIViewController_IOS7Adapter.h"
@protocol LeftViewDisplayDelegate <NSObject>
- (void) viewDisplayWith:(LeftCellModel *) cellModel;
@end
@interface LeftViewController : UITableViewController
@property (nonatomic,weak) id<LeftViewDisplayDelegate> viewDelegate;
@end