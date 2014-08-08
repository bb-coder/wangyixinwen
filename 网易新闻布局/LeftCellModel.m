//
//  LeftCellModel.m
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "LeftCellModel.h"

@implementation LeftCellModel

+ (instancetype)leftCellWithTitle:(NSString *)title andClassName:(NSString *)className andImage:(UIImage *)image
{
    LeftCellModel * leftCellModel = [[LeftCellModel alloc]init];
    leftCellModel.title = title;
    leftCellModel.className = className;
    leftCellModel.image = image;
    return leftCellModel;
    
}
@end
