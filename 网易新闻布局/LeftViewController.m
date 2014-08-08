//
//  LeftViewController.m
//  网易新闻布局
//
//  Created by bb_coder on 14/8/2.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()
{
    NSArray * _data;
}
@end

@implementation LeftViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    LeftCellModel * news = [LeftCellModel leftCellWithTitle:@"新闻" andClassName:@"NewsViewController" andImage:[UIImage imageNamed:@"sidebar_nav_news.png"]];
    LeftCellModel * local = [LeftCellModel leftCellWithTitle:@"本地" andClassName:@"LocalViewController" andImage:[UIImage imageNamed:@"sidebar_nav_local.png"]];
    LeftCellModel * photo = [LeftCellModel leftCellWithTitle:@"图片" andClassName:@"PhotoViewController" andImage:[UIImage imageNamed:@"sidebar_nav_photo.png"]];
    
    _data = @[news,local,photo];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellMain = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellMain];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellMain];
    }
    LeftCellModel * leftCellModel=_data[indexPath.row];
    cell.textLabel.text = leftCellModel.title;
    cell.imageView.image = leftCellModel.image;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if ([self.viewDelegate respondsToSelector:@selector(viewDisplayWith:)]) {
            [self.viewDelegate viewDisplayWith:_data[indexPath.row]];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
