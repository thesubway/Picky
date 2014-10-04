//
//  Profile.m
//  Picky
//
//  Created by William Wu on 10/4/14.
//  Copyright (c) 2014 Tomo Ueda. All rights reserved.
//

#import "Profile.h"
#import "RecentMealsCell.h"
#import "YourPicksCell.h"

@interface Profile ()
@property (weak, nonatomic) IBOutlet UILabel *profileTitle;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UICollectionView *recentMeals;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UICollectionView *yourPicks;

@property NSArray *recentMealsArray;
@property NSArray *yourPicksArray;

@end

@implementation Profile

- (void)viewDidLoad {
    [super viewDidLoad];
    self.recentMeals.delegate = self;
    self.recentMeals.dataSource = self;
    self.yourPicks.delegate = self;
    self.yourPicks.dataSource = self;
    if (!self.recentMealsArray) {
        self.recentMealsArray = [[NSArray alloc] init];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([collectionView isEqual:self.recentMeals]) {
        return self.recentMealsArray.count;
    }
    else if ([collectionView isEqual:self.yourPicks]) {
        return self.yourPicksArray.count;
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView isEqual:self.recentMeals]) {
        RecentMealsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recentMealsCell" forIndexPath:indexPath];
        return cell;
    }
    else if ([collectionView isEqual:self.yourPicks]) {
        YourPicksCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"yourPicksCell" forIndexPath:indexPath];
        return cell;
    }
    else {
        return nil;
    }
}

@end
