//
//  Pages.m
//  Picky
//
//  Created by William Wu on 10/5/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Pages.h"
#import "ViewController.h"
#import "Explore.h"
#import "Profile.h"
#import "Meals.h"
#import "Rating.h"

@interface Pages ()

@end

@implementation Pages

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setDataSource: self];
    [self setViewControllers: @[[self.storyboard instantiateViewControllerWithIdentifier: @"viewController"]] direction: UIPageViewControllerNavigationDirectionForward animated: NO completion: nil];
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass: [ViewController class]])
    {
        return [self.storyboard instantiateViewControllerWithIdentifier: @"explore"];
    }
    if ([viewController isKindOfClass: [Profile class]])
    {
        return [self.storyboard instantiateViewControllerWithIdentifier: @"explore"];
    }
    if ([viewController isKindOfClass: [Meals class]])
    {
        return [self.storyboard instantiateViewControllerWithIdentifier: @"profile"];
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass: [ViewController class]])
    {
        return [self.storyboard instantiateViewControllerWithIdentifier: @"explore"];
    }
    if ([viewController isKindOfClass: [Explore class]])
    {
        return [self.storyboard instantiateViewControllerWithIdentifier: @"profile"];
    }
    if ([viewController isKindOfClass: [Profile class]])
    {
        return [self.storyboard instantiateViewControllerWithIdentifier: @"meals"];
    }
    return nil;
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
