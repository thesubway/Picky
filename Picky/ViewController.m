//
//  ViewController.m
//  Picky
//
//  Created by Tomo Ueda on 10/3/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "ViewController.h"
#import "Explore.h"

@interface ViewController ()

@end
@implementation ViewController

static bool cameraShown = NO;
- (void)viewDidLoad {
    [super viewDidLoad];
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
    }];
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"";
    alert.message = @"Enjoy your food!";
    [alert addButtonWithTitle:@"OK!"];
    [alert show];
}
- (IBAction)takePicPressed:(UIButton *)sender {
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
