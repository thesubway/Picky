//
//  ViewController.m
//  Picky
//
//  Created by Tomo Ueda on 10/3/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"HI WILLIAM");
    NSLog(@"blahblah");
    NSLog(@"what");
    NSLog(@"Dan says hi");
}

- (void)viewDidAppear:(BOOL)animated {
    if (NO)
    {
    [super viewDidAppear:animated];
//    if UIImagePickerController
    UIImagePickerController *imag = [[UIImagePickerController alloc] init];
    imag.delegate = self;
    imag.sourceType = UIImagePickerControllerSourceTypeCamera;
    imag.allowsEditing = false;
    
//    self presentViewController(imag, animated: true, completion: nil);
    [self presentViewController:imag animated:true completion:nil];
    }
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
