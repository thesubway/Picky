//
//  MealDatabase.h
//  Picky
//
//  Created by Logan Carter on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface MealDatabase : NSObject
{
@private
    PFQuery* query;
    PFObject* meal;
}

@property int numratings;
@property float avgrating;
@property NSArray *photos;
@property NSString *mealName;
@property NSString *restaurantName;

@end
