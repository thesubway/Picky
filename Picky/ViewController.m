//
//  ViewController.m
//  Picky
//
//  Created by Tomo Ueda on 10/3/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "ViewController.h"
#import "Explore.h"
#import "User.h"
#import "Rating.h"
#import "Profile.h"

@interface ViewController ()
@property User *currentUser;
@end
@implementation ViewController

static bool cameraShown = NO;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentUser = [[User alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
//    if UIImagePickerController
    if (cameraShown == NO) {
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            cameraShown = YES;
            UIImagePickerController *imag = [self imagePicker];
            imag.delegate = self;
            imag.sourceType = UIImagePickerControllerSourceTypeCamera;
            imag.allowsEditing = false;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [self presentViewController:imag animated:true completion:nil];
            });
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] init];
            alert.title = @"No camera detected";
            alert.message = @"This device does not have a camera available";
            [alert addButtonWithTitle:@"OK"];
            [alert show];
        }
    }
}

-(UIImagePickerController *)imagePicker{
    if(!_imgPicker){
        _imgPicker = [[UIImagePickerController alloc]init];
        _imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    return _imgPicker;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
        //save image data.
        UIImage *takenImage = info[UIImagePickerControllerOriginalImage];
        NSData * imageData = UIImageJPEGRepresentation(takenImage, 1.0);
        
        
        //save to the default 100Apple(Camera Roll) folder.
        
        [imageData writeToFile:@"resources/images/recent.jpg" atomically:NO];
        Rating *rating = [self.storyboard instantiateViewControllerWithIdentifier:@"rating"];
        rating.displayImage = takenImage;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:rating animated:YES];
//        });
    }];
    
}

- (IBAction)takePicPressed:(id)sender {
    Explore *explore = [self.storyboard instantiateViewControllerWithIdentifier:@"explore"];
        [self.navigationController pushViewController:explore animated:YES];
}


- (void) randomMethod
{
    return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
