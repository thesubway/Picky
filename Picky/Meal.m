//
//  Meal.m
//  Picky
//
//  Created by Logan Carter on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Meal.h"

@implementation Meal
-(id) init
{
    self = [super init];
    if (self)
    {
        query = [PFQuery queryWithClassName:@"meal"];
        meal = [PFObject objectWithClassName:@"meal"];
        numratings = 0;
        avgrating = [[meal objectForKey:@"avgRating"] floatValue];
        photos = [meal objectForKey:@"allPhotos"];
    }
    return self;
}
- (float) getAvgRating {
    return avgrating;
}

- (NSArray *) getPhotos {
    return photos;
}

- (void) setAvgRating {
    float sum = 0;
    for (int i = 0; i < photos.count; i ++)
    {
        sum += [photos[i] getRetrievedRating]
    }
    float total = sum / numratings;
    meal[@"avgRating"] = @total;
    [meal saveInBackground];
}

- (void) setPhotos
    {
        //not sure how to do this yet, I think I need to use photo class, loop through all photos
        //and add a photo to allPhotos if the name of the meal matches the name of this meal
    }
@end
