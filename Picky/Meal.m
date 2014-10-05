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
        PFQuery *query = [PFQuery queryWithClassName:@"Meal"];
    }
}

@end
