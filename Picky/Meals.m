//
//  Meals.m
//  Picky
//
//  Created by William Wu on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Meals.h"

@interface Meals ()
@property (weak, nonatomic) IBOutlet UILabel *mealsTitle;
@property (weak, nonatomic) IBOutlet UITableView *mealsTable;

@end

@implementation Meals

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_mealsTable setRowHeight: 100];
    [_mealsTable setDelegate: self];
    [_mealsTable setDataSource: self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"cell"];
    UILabel * foodName = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, tableView.bounds.size.width / 2, [tableView rowHeight] / 2)];
    [foodName setText: @"My Anaconda"];
    [foodName setFont: [UIFont fontWithName: @"Verdana" size: 10]];
    [[cell contentView] addSubview: foodName];
    UILabel * subtitle = [[UILabel alloc] initWithFrame: CGRectMake(0, [tableView rowHeight] / 2, tableView.bounds.size.width / 2, [tableView rowHeight] / 2)];
    [subtitle setText: @"Nicki Minaj feat. Tomo"];
    [subtitle setFont: [UIFont fontWithName: @"Verdana" size: 10]];
    [[cell contentView] addSubview: subtitle];
    UIImageView * image = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"luisvasquez.jpg"]];
    [image setFrame: CGRectMake(tableView.bounds.size.width / 2, 0, tableView.bounds.size.width / 2, [tableView rowHeight])];
    [[cell contentView] addSubview: image];
//    UIImageView * preview = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"williamwu.jpg"]];
//    [preview setFrame: CGRectMake(0, 0, tableView.bounds.size.width, 100)];
//    [[cell contentView] addSubview: preview];
    return cell;
}

- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section
{
    return nil;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
    return 2;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
    return 3;
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    [self onTap];
    
}

- (void) onTap
{
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
