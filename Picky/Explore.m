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
@property int imageIndex;

@end

@implementation Explore

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initImage];
    [self initCache];
    
    UIImage * image = [UIImage imageNamed: @"tomoueda.jpg"];
    [_currentImage setImage: image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
* initializes the image with swiping capability
*/
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

/*
* initializes the cache of images
*/
- (void) initCache
{
    _imageCache = [[NSMutableArray alloc] init];
}

/*
* increases the upvote counter of an image
*/
- (void) upvote
{
    /* YOUR CODE HERE */
}

/*
* gets a random picture of a random food
*/
- (UIImage *) getNewPicture: (int) direction
{
    UIImage * image;
    if (direction == 1)
    {
        NSLog(@"swipe left");
        UIImage * newImage = [[UIImage alloc] init];
        
        /* YOUR CODE HERE */
        
        if (_imageIndex < [_imageCache count])
        {
            _imageIndex++;
            return [_imageCache objectAtIndex: _imageIndex];
        }
        else
        {
            _imageIndex++;
            [_imageCache addObject: newImage];
            return newImage;
        }
    }
    if (direction == -1)
    {
        NSLog(@"swipe right");
        if (_imageIndex > 0)
        {
            _imageIndex--;
            return [_imageCache objectAtIndex: _imageIndex];
        }
    }
    return image;
}

/*
* changes the picture when the picture is swiped
*/
- (void) onSwipe: (id) sender
{
    if ([sender direction] == UISwipeGestureRecognizerDirectionLeft)
    {
        [_currentImage setImage: [self getNewPicture: 1]];
    }
    if ([sender direction] == UISwipeGestureRecognizerDirectionRight)
    {
        [_currentImage setImage: [self getNewPicture: -1]];
    }
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
