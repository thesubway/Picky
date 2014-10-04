//
//  Explore.m
//  Picky
//
//  Created by William Wu on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Explore.h"

@interface Explore ()

@property NSMutableArray * recentlyViewed;

@end

@implementation Explore

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _recentlyViewed = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) upvote
{
    
}

- (UIImage *) getNewPicture
{
    UIImage * image;
    /* YOUR CODE HERE */
    return image;
}

- (void) nextPicture
{
    UIImage * newImage = [self getNewPicture];
    [_currentImage setImage: newImage];
}

- (void) prevPicture
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
