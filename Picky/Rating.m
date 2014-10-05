//
//  Rating.m
//  Picky
//
//  Created by William Wu on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Rating.h"
#import "PhotoDatabase.h"
#import "ViewController.h"

@interface Rating ()
{
    @private
        PhotoDatabase * database;
}
@property (weak, nonatomic) IBOutlet UILabel *ratingTitle;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextField *foodName;
@property (weak, nonatomic) IBOutlet UITextField *restaurantName;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UIButton *oneStar;
@property (weak, nonatomic) IBOutlet UIButton *twoStar;
@property (weak, nonatomic) IBOutlet UIButton *threeStar;
@property (weak, nonatomic) IBOutlet UIButton *fourStar;
@property (weak, nonatomic) IBOutlet UIButton *fiveStar;

@property double rating;



@end

@implementation Rating

- (void)viewDidLoad {
    [super viewDidLoad];
    database = [[PhotoDatabase alloc] init];
    self.image.image = self.displayImage;
    _rating = 0.0;
    [self initGestures];
    [self initScroll];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"";
    alert.message = @"Enjoy your food!";
    [alert addButtonWithTitle:@"OK!"];
    [alert show];
    // Do any additional setup after loading the view.
//    [_image setImage: [UIImage imageNamed: @"recent.jpg"]];
}

- (void) initGestures
{
    UITapGestureRecognizer * gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(resignResponders:)];
    [self.view addGestureRecognizer: gestureRecognizer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
}

- (void) initScroll
{
    [_scrollView setScrollEnabled: YES];
    [_scrollView setUserInteractionEnabled: YES];
}

- (void) resignResponders: (id) sender
{
    [_restaurantName resignFirstResponder];
    [_foodName resignFirstResponder];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [_scrollView setContentOffset:CGPointMake(0, kbSize.height) animated:YES];
}
//called when the text field is being edited
- (IBAction)textFieldDidBeginEditing:(UITextField *)sender
{
    [sender setDelegate: self];
}

- (IBAction) onSubmit: (id) sender
{
    int photoId = 0; // fix this
    NSInteger userId = 0; // just your facebook id
    double x = 0.0;
    double y = 0.0;
    [database uploadPhotoDataid: photoId
                      locationx: x
                      locationy: y
                         rating: _rating
                     restaurant: [_restaurantName text]
                          title: [_foodName text]
                          image: UIImageJPEGRepresentation(self.displayImage, 1.0)
                           user: userId];
}


- (IBAction)onOnestar:(id)sender
{
    [_oneStar setTitle: @"★" forState: UIControlStateNormal];
    [_twoStar setTitle: @"☆" forState: UIControlStateNormal];
    [_threeStar setTitle: @"☆" forState: UIControlStateNormal];
    [_fourStar setTitle: @"☆" forState: UIControlStateNormal];
    [_fiveStar setTitle: @"☆" forState: UIControlStateNormal];
    _rating = 1.0;
}
- (IBAction)onTwostars:(id)sender
{
    [_oneStar setTitle: @"★" forState: UIControlStateNormal];
    [_twoStar setTitle: @"★" forState: UIControlStateNormal];
    [_threeStar setTitle: @"☆" forState: UIControlStateNormal];
    [_fourStar setTitle: @"☆" forState: UIControlStateNormal];
    [_fiveStar setTitle: @"☆" forState: UIControlStateNormal];
    _rating = 2.0;
}
- (IBAction)onThreestars:(id)sender
{
    [_oneStar setTitle: @"★" forState: UIControlStateNormal];
    [_twoStar setTitle: @"★" forState: UIControlStateNormal];
    [_threeStar setTitle: @"★" forState: UIControlStateNormal];
    [_fourStar setTitle: @"☆" forState: UIControlStateNormal];
    [_fiveStar setTitle: @"☆" forState: UIControlStateNormal];
    _rating = 3.0;
}
- (IBAction)onFourstars:(id)sender
{
    [_oneStar setTitle: @"★" forState: UIControlStateNormal];
    [_twoStar setTitle: @"★" forState: UIControlStateNormal];
    [_threeStar setTitle: @"★" forState: UIControlStateNormal];
    [_fourStar setTitle: @"★" forState: UIControlStateNormal];
    [_fiveStar setTitle: @"☆" forState: UIControlStateNormal];
    _rating = 4.0;
}
- (IBAction)onFivestars:(id)sender
{
    [_oneStar setTitle: @"★" forState: UIControlStateNormal];
    [_twoStar setTitle: @"★" forState: UIControlStateNormal];
    [_threeStar setTitle: @"★" forState: UIControlStateNormal];
    [_fourStar setTitle: @"★" forState: UIControlStateNormal];
    [_fiveStar setTitle: @"★" forState: UIControlStateNormal];
    _rating = 5.0;
}

- (IBAction)submitPressed:(UIButton *)sender {
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    [viewController setCameraShown]; //this sets cameraShown to NO.
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
