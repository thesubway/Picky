//
//  PhotoDatabase.h
//  Picky
//
//  Created by Tomo Ueda on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface PhotoDatabase : NSObject <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

{
@private
    PFQuery* query;
    PFObject* photo;
}

@property double retrievedRating;
@property double retrievedX;
@property double retrievedY;
@property NSString* retrievedRestaurant;
@property NSString* retrievedTitle;
@property PFFile* retrievedImageJPG;
@property NSInteger retrievedUserid;
@property bool retrieved;


- (void) fillFieldFromDataBaseWithID: (int) photoid;
- (double) getRetrievedRating;
- (double) getRetrievedX;
- (double) getRetrievedY;
- (NSString*) getRetrievedRestaurant;
- (NSString*) getRetrievedTitle;
- (PFFile*) getRetrievedImageJPG;
- (NSInteger) getRetrievedUserId;
- (bool) getRetrieved;


@end
