//
//  Explore.m
//  Picky
//
//  Created by William Wu on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Explore.h"

@interface Explore ()

@property (weak, nonatomic) IBOutlet UIImageView *currentImage;
@property (weak, nonatomic) IBOutlet UILabel *exploreTitle;
@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property NSMutableArray * imageCache;

@end

@implementation Explore

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initImage];
    
    UIImage * image = [UIImage imageNamed: @"tomoueda.jpg"];
    [_currentImage setImage: image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initImage
{
    [_currentImage setUserInteractionEnabled: YES];
    UISwipeGestureRecognizer * swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget: self action:@selector(onSwipe:)];
    UISwipeGestureRecognizer * swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget: self action:@selector(onSwipe:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection: UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection: UISwipeGestureRecognizerDirectionRight];
    
    // Adding the swipe gesture on image view
    [_currentImage addGestureRecognizer: swipeLeft];
    [_currentImage addGestureRecognizer: swipeRight];
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

- (void) onSwipe: (id) sender
{
    UIImage * newImage = [self getNewPicture];
    [_currentImage setImage: newImage];
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
