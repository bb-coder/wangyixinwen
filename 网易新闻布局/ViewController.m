//
//  ViewController.m
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ViewController.h"
#define kLeftWidth 150
#define kRightWidth 200
@interface ViewController ()
{

    LeftViewController *_leftViewController;
    CGFloat _lastLocationX;
    NSMutableDictionary * _data;
}
@end

@implementation ViewController

//左视图代理方法
-(void)viewDisplayWith:(LeftCellModel *)cellModel
{
    CGRect frame = _contentView.frame;
    frame.origin.x = 0;
    [UIView beginAnimations:nil context:nil];
    _contentView.frame = frame;
    [UIView commitAnimations];
    
    NSString * className = cellModel.className;
    UIViewController * vc = _data[className];
    
    if (!vc) {
        Class c= NSClassFromString(className);
        UIViewController *myvc = [[c alloc]init];
        UIView * titleView = [[UIView alloc]init];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navbar_netease.png"]];
        imageView.frame = CGRectMake(0, 0, 45, 22);
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(45, 0, 45, 22)];
        label.text = cellModel.title;
        [titleView addSubview:imageView];
        [titleView addSubview:label];
        myvc.navigationItem.titleView = titleView;
        
        UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(0, 0, 45, 44);
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_menuicon.png"] forState:UIControlStateNormal];
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_menuicon_highlighted.png"] forState:UIControlStateHighlighted];
        [leftBtn addTarget:self action:@selector(clickLeftItem) forControlEvents:UIControlEventTouchUpInside];
        myvc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
        UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(0, 0, 45, 44);
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_infoicon.png"] forState:UIControlStateNormal];
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_infoicon_highlighted.png"] forState:UIControlStateHighlighted];
        [rightBtn addTarget:self action:@selector(clickRightItem) forControlEvents:UIControlEventTouchUpInside];
        myvc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];

        vc = [[UINavigationController alloc]initWithRootViewController:myvc];
        [_data setObject:vc forKey:className];
    }
    [_contentView addSubview:vc.view];
    
}
- (void) clickButtonWithLeft:(BOOL) left
{
    CGRect frame = _contentView.frame;
        if (frame.origin.x == 0) {
            frame.origin.x = left ? kLeftWidth : -kRightWidth;
        }
        else
            frame.origin.x = 0;
    [UIView beginAnimations:nil context:nil];
    _contentView.frame = frame;
    [UIView commitAnimations];
}

- (void) clickLeftItem
{
    [self clickButtonWithLeft:YES];
    [self.rightView setHidden:YES];
    [self.leftView setHidden:NO];
    [self.contentView.layer setShadowOffset:CGSizeMake(.5f, 0)];
    
}

- (void) clickRightItem
{
    [self clickButtonWithLeft:NO];
    [self.rightView setHidden:NO];
    [self.leftView setHidden:YES];
    [self.contentView.layer setShadowOffset:CGSizeMake(-.5f, 0)];
    
}
//拖拽手势
- (void) panContentView:(UIPanGestureRecognizer *) pan
{

    if (UIGestureRecognizerStateBegan == pan.state) {
        _lastLocationX = self.contentView.frame.origin.x;
    }
    //拖动contentView
    CGPoint point = [pan translationInView:self.view];
    CGRect frame = self.contentView.frame;
    CGFloat tempX = _lastLocationX + point.x;
    
    
    //限制contentView活动范围
    if (tempX >= kLeftWidth) {
        tempX = kLeftWidth;
    }
    if (tempX <= -kRightWidth) {
        tempX = -kRightWidth;
    }
    
    //拖拽不彻底情况下处理
    if (UIGestureRecognizerStateEnded == pan.state) {
        if (tempX < -kRightWidth * 0.5)
            tempX = -kRightWidth;
        else if (tempX < 0 || (tempX < kLeftWidth * 0.5 && tempX >= 0))
            tempX = 0;
        else
            tempX = kLeftWidth;
        frame.origin.x = tempX;
        [UIView beginAnimations:nil context:nil];
        self.contentView.frame = frame;
        [UIView commitAnimations];
        return;
    }
    
    //判断拖动方向隐藏左右view
        if (tempX >= 0) {
            [self.rightView setHidden:YES];
            [self.leftView setHidden:NO];
            [self.contentView.layer setShadowOffset:CGSizeMake(.5f, 0)];
        }
        if (tempX < 0) {
            [self.rightView setHidden:NO];
            [self.leftView setHidden:YES];
            [self.contentView.layer setShadowOffset:CGSizeMake(-.5f, 0)];
        }
    frame.origin.x = tempX;
    self.contentView.frame = frame;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self ios7Adapeter];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top_navigation_background.png"] forBarMetrics:UIBarMetricsDefault];
    _data = [[NSMutableDictionary alloc]init];
    _leftViewController = [[LeftViewController alloc]init];
    _leftViewController.view.frame = _leftView.bounds;
    _leftViewController.viewDelegate = self;
    [_leftView addSubview:_leftViewController.view];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panContentView:)];
    [self.contentView addGestureRecognizer:pan];
    [self.contentView setUserInteractionEnabled:YES];
    
    //设置中间contentView的阴影
    [self.contentView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.contentView.layer setShadowOpacity:.8f];
    
    [self viewDisplayWith:[LeftCellModel leftCellWithTitle:@"新闻" andClassName:@"NewsViewController" andImage:[UIImage imageNamed:@"sidebar_nav_news.png"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
