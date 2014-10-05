//
//  Explore.m
//  Picky
//
//  Created by William Wu on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Explore.h"
#import "Profile.h"
#import "PhotoDatabase.h"
#import "Rating.h"

@interface Explore ()

@property (weak, nonatomic) IBOutlet UIImageView *currentImage;
@property (strong, nonatomic) IBOutlet UILabel *foodTitle;

@property (weak, nonatomic) IBOutlet UILabel *exploreTitle;
@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
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
    _imageIndex = -1;
    [_currentImage setImage: image];
    if (self.ratingStars != nil) {
        self.ratingLabel.text = self.ratingStars;
    }
    if (self.ratedFoodName != nil) {
        self.foodTitle.text = self.ratedFoodName;
    }
    if (self.ratedLocation != nil) {
        self.restaurantName.text = self.ratedLocation;
    }
    if (self.ratedImage != nil) {
        self.currentImage.image = self.ratedImage;
    }
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
    
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(onDoubleTap:)];
    [doubleTap setNumberOfTapsRequired: 2];
    [_currentImage addGestureRecognizer: doubleTap];
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
- (void) updateVote
{
    /* YOUR CODE HERE */
}

- (void) onDoubleTap: (id) sender
{
    [self updateVote];
}







- (void) updateRestaurant: (NSString *) name
{
    [_restaurantName setText: name];
}






/*
* gets a random picture of a random food
*/
- (UIImage *) updateImage: (int) direction
{
    UIImage * image;
    if (direction == 1)
    {
        NSLog(@"swipe left");
        
        UIImage * newImage;
        // TEST CODE //
        int random = arc4random_uniform(5);
        NSLog(@"rand num: %d",random);
        if (random == 0)
        {
            newImage = [UIImage imageNamed: @"tomoueda.jpg"];
        }
        else if (random == 1)
        {
            newImage = [UIImage imageNamed: @"luisvasquez.jpg"];
        }
        else if (random == 2)
        {
            newImage = [UIImage imageNamed: @"logancarter.jpg"];
        }
        else if (random == 3)
        {
            newImage = [UIImage imageNamed: @"williamwu.jpg"];
        }
        else if (random == 4)
        {
            newImage = [UIImage imageNamed: @"anderstruong.jpg"];
        }
        // END TEST CODE //
        
        /* YOUR CODE HERE */
        
        if (_imageIndex < [_imageCache count])
        {
            _imageIndex++;
            NSLog(@"%d", _imageIndex);
            return [_imageCache objectAtIndex: _imageIndex - 1];
        }
        else
        {
            _imageIndex++;
            [_imageCache addObject: newImage];
            NSLog(@"%d", _imageIndex);
            return newImage;
        }
    }
    if (direction == -1)
    {
        UIImage * closestFood = [UIImage imageNamed: @"tomoueda.jpg"]; //would be "closest food"

//        if (_imageIndex == 0)
//        {
//            _imageIndex++;
//            NSLog(@"%d", _imageIndex);
//            return [_imageCache objectAtIndex: _imageIndex];
//        }
//        if (!(_imageIndex > 0))
//        {
//            return NO;
//        }
        NSLog(@"swipe right");
        if ([_imageCache count] == 0)
        {
            _imageIndex++;
            [_imageCache addObject: closestFood];
            NSLog(@"%d", _imageIndex);
            return closestFood;
        }
        if (_imageIndex > 0)
        {
            _imageIndex--;
            NSLog(@"%d", _imageIndex);
            return [_imageCache objectAtIndex: _imageIndex];
        }
        else {
            if (_imageIndex == 0)
            {
                return closestFood;
            }
            else {
                _imageIndex++;
                NSLog(@"%d", _imageIndex);
                return [_imageCache objectAtIndex: _imageIndex];
            }
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
        [_currentImage setImage: [self updateImage: 1]];
    }
    else if ([sender direction] == UISwipeGestureRecognizerDirectionRight)
    {
        [_currentImage setImage: [self updateImage: -1]];
    }
    [self updateRestaurant: @"Location: Thai Basil"];
}

- (IBAction)profilePressed:(UIBarButtonItem *)sender {
    Profile *profile = [self.storyboard instantiateViewControllerWithIdentifier:@"profile"];
        [self.navigationController pushViewController:profile animated:YES];
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
