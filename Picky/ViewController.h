//
//  ViewController.h
//  Picky
//
//  Created by Tomo Ueda on 10/3/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, FBLoginViewDelegate>

@property UIImagePickerController *imgPicker;
@property UIImage *currentImage;
-(void) setCameraShown;
@end

