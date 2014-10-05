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
    }
    return self;
}
- (float) getAvgRating {
    float rating = [[meal objectForKey:@"avgRating"] floatValue];
    return rating;
}

@end
