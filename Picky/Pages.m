//
//  Pages.m
//  Picky
//
//  Created by William Wu on 10/5/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Pages.h"

@interface Pages ()

@end

@implementation Pages

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setDataSource: self];
    [self setViewControllers: @[[self.storyboard instantiateViewControllerWithIdentifier: @"viewController"]] direction: UIPageViewControllerNavigationDirectionForward animated: YES completion: nil];
}


//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
//{
//    if ([viewController isKindOfClass:[PageOneViewController class]])
//        return nil;
//    
//    return [self.storyboard instantiateViewControllerWithIdentifier:@"one"];
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
//{
//    if ([viewController isKindOfClass:[PageTwoViewController class]])
//        return nil;
//    
//    return [self.storyboard instantiateViewControllerWithIdentifier:@"two"];
//}


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
