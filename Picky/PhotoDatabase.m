//
//  PhotoDatabase.m
//  Picky
//
//  Created by Tomo Ueda on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "PhotoDatabase.h"

@implementation PhotoDatabase
@synthesize retrievedRating;
@synthesize retrievedX;
@synthesize retrievedY;
@synthesize retrievedRestaurant;
@synthesize retrievedTitle;
@synthesize retrievedImageJPG;
@synthesize retrievedUserid;
@synthesize retrieved;

-(id) init {
    self = [super init];
    if (self) {
        query = [PFQuery queryWithClassName:@"photo"];
        photo = [PFObject objectWithClassName:@"photo"];
        retrieved = false;
    }
    return self;
}

/** ImageData should be made from photo that we took. **/
-(void) uploadPhotoDataid:(int) photoid
                 locationx:(double) x
                locationy:(double) y
                   rating:(double) rating
               restaurant:(NSString*) restaurant
                    title:(NSString*) title
                    image:(NSData*) imageData
                     user:(NSInteger) userid {
    PFFile* imageFile = [PFFile fileWithName:@"image.jpg" contentsAtPath:(NSString*)imageData];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [photo setObject:imageFile forKey:@"imageFile"];
            photo.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            [photo setObject:[NSNumber numberWithInt:photoid] forKey:@"id"];
            [photo setObject:[NSNumber numberWithInteger:userid] forKey:@"user"];
            [photo setObject:[NSNumber numberWithDouble:x] forKey:@"locx"];
            [photo setObject:[NSNumber numberWithDouble:y] forKey:@"locy"];
            [photo setObject:[NSNumber numberWithDouble:rating] forKey:@"rating"];
            [photo setObject:restaurant forKey:@"restaurant"];
            [photo setObject:title forKey:@"title"];
        } else {
              NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];
}

/** WHEN RETRIEVEING ALWAYS CALL THIS FUNCTION FIRST! */
- (void) fillFieldFromDataBaseWithID: (int) photoid {
    [query whereKey:@"id" equalTo:[NSNumber numberWithInt:photoid]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (objects.count == 0) {
                retrieved = false;
            } else {
                retrieved = true;
                for (PFObject* object in objects) {
                    retrievedRating = [object[@"rating"] doubleValue];
                    retrievedX = [object[@"x"] doubleValue];
                    retrievedY = [object[@"y"] doubleValue];
                    retrievedRestaurant = object[@"restaurant"];
                    retrievedTitle = object[@"title"];
                    retrievedUserid = [object[@"user"] integerValue];
                    retrievedImageJPG = object[@"imageFile"];
                }
            }
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

/** Always call this after you call getRatingFromDataBaseWithID.*/
-(double) getRetrievedRating {
    return retrievedRating;
}

- (double) getRetrievedX {
    return retrievedX;
}

- (double) getRetrievedY {
    return retrievedY;
}

- (NSString*) getRetrievedRestaurant {
    return retrievedRestaurant;
}

- (NSString*) getRetrievedTitle {
    return retrievedTitle;
}

- (PFFile*) getRetrievedImageJPG {
    return retrievedImageJPG;
}

- (NSInteger) getRetrievedUserId {
    return retrievedUserid;
}



@end
