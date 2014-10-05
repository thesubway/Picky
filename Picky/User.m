//
//  User.m
//  Picky
//
//  Created by Tomo Ueda on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "User.h"

@implementation User

- (id) init {
    self = [super init];
    if (self) {
        query = [PFQuery queryWithClassName:@"UserID" ];
        [query getObjectInBackgroundWithId:@"xWMyZ4YEGZ" block:^(PFObject *userID, NSError *error) {
            // Do something with the returned PFObject in the gameScore variable.
            NSLog(@"%@", userID);
            user = userID;

        }];
    }
    return self;
}

- (int) getUserID {
    int id = [[user objectForKey:@"ID"] intValue];
    return id;
}


- (NSString*) getUserName {
    NSString* name = [[user objectForKey:@"Name"] stringValue];
    return name;
}

- (void) setUserID: (id) uID {
    PFObject *userID = [PFObject objectWithClassName:@"UserID"];
    userID[@"uID"] = uID;
    [userID saveInBackground];
}


- (void) setUserName: (NSString *) string {
//    PFObject *userName = [PFObject objectWithClassName:@"User"];
//    gameScore[@"score"] = @1337;
//    gameScore[@"playerName"] = @"Se";
//    gameScore[@"cheatMode"] = @NO;
//    [gameScore saveInBackground];
}

@end
