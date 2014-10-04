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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
