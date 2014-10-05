//
//  Rating.m
//  Picky
//
//  Created by William Wu on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Rating.h"

@interface Rating ()
@property (weak, nonatomic) IBOutlet UILabel *ratingTitle;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextField *foodName;
@property (weak, nonatomic) IBOutlet UIButton *submit;


@end

@implementation Rating


- (void)viewDidLoad {
    [super viewDidLoad];
    self.image.image = self.displayImage;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"";
    alert.message = @"Enjoy your food!";
    [alert addButtonWithTitle:@"OK!"];
    [alert show];
}

- (IBAction) onSubmit: (id) sender
{
    /* YOUR CODE HERE */
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
