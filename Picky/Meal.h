//
//  Meal.h
//  Picky
//
//  Created by Logan Carter on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Meal : NSObject
{
    @private
    PFQuery* query;
    PFObject* meal;
}
    
@end
