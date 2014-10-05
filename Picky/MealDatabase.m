//
//  MealDatabase.m
//  Picky
//
//  Created by Logan Carter on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "MealDatabase.h"

@implementation MealDatabase
@synthesize numratings;
@synthesize avgrating;
@synthesize photos;
@synthesize mealName;
@synthesize restaurantName;

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

- (void) uploadMealData : (int) mealID
          numberOfRating: (int) numrating
               avgrating: (double) averagerating
                 photoIDs: (NSArray*) photoIDs
          restaurantName: (NSString*) restName
                mealName: (NSString*) mName
{
    meal[@"id"]=[NSNumber numberWithInt:mealID];
    meal[@"numrating"] = [NSNumber numberWithInt:numrating];
    meal[@"avgrating"] = [NSNumber numberWithDouble:averagerating];
    [meal addUniqueObjectsFromArray:photoIDs forKey:@"photoids"];
    meal[@"restaurantName"] = restName;
    meal[@"mealName"] = mName;
    [meal saveInBackground];
    
}

-(void) addPhotoIDtoMealID: (int) mealID
                   photoID: (NSString*) photo {
    [query whereKey:@"id" equalTo:[NSNumber numberWithInt:mealID]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject* object in objects) {
                [object addObject:photo forKey:@"photoids"];
                [object saveInBackground];
            }
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
@end
