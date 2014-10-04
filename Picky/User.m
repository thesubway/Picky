//
//  User.m
//  Picky
//
//  Created by Tomo Ueda on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize idnum;

- (id) initWithId: (int) userid
{
    self = [super init];
    if (self) {
        query = [PFQuery queryWithClassName:@"user"];
        user = [PFObject objectWithClassName:@"user"];
        [query whereKey:@"userid" equalTo:[NSString stringWithFormat:@"%d", userid]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                if ([objects count] != 0) {
                    idnum = userid;
                } else {
                    user[@"userid"] = [NSString stringWithFormat:@"%d", userid];
                    [user saveInBackground];
                    idnum = userid;
                }
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
    return self;
}

- (NSMutableArray*) getRecentPhotofromIndex: (int) from to: (int) here
{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    return array;
}



@end
