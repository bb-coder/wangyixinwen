//
//  LeftCellModel.h
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeftCellModel : NSObject

@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * className;
@property (nonatomic,strong) UIImage * image;

+ (instancetype) leftCellWithTitle:(NSString *) title
                  andClassName:(NSString *) className
                      andImage:(UIImage *) image;
@end
