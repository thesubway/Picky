//
//  User.h
//  Picky
//
//  Created by Tomo Ueda on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : NSObject

{
@private
    PFQuery* query;
    PFObject* user;
}

@property NSInteger idnum;

-(id) initWithId:(int) idnum;

@end
