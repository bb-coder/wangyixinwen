//
//  NewsViewController.m
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "NewsViewController.h"
#import "NextViewController.h"
static const int a[3] ={30,50,70};
@interface NewsViewController ()
{
    NextViewController * _next;
}
@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _next = [[NextViewController alloc]init];
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)clickButton:(id)sender {
    
    [self.navigationController pushViewController:_next animated:YES];
   static int a[1] = {80};
    a[0] ++;
    NSLog(@"%d",a[0]);
}
@end
