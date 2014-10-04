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
//    [self.recentMeals reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([collectionView isEqual:self.recentMeals]) {
//        return self.recentMealsArray.count;
        return 5;
    }
    else if ([collectionView isEqual:self.yourPicks]) {
//        return self.yourPicksArray.count;
        return 5;
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView isEqual:self.recentMeals]) {
        RecentMealsCell *cell
        = [collectionView dequeueReusableCellWithReuseIdentifier:@"recentMealsCell" forIndexPath:indexPath];
        int randNum = arc4random() % 5;
        if (randNum == 0) {
            cell.imageView.image = [UIImage imageNamed:@"anderstruong.jpg"];
        }
        else if (randNum == 1) {
            cell.imageView.image = [UIImage imageNamed:@"logancarter.jpg"];
        }
        else if (randNum == 2) {
            cell.imageView.image = [UIImage imageNamed:@"luisvasquez.jpg"];
        }
        else if (randNum == 3) {
            cell.imageView.image = [UIImage imageNamed:@"williamwu.jpg"];
        }
        else if (randNum == 4) {
            cell.imageView.image = [UIImage imageNamed:@"tomoueda.jpg"];
        }
        return cell;
    }
    else if ([collectionView isEqual:self.yourPicks]) {
        YourPicksCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"yourPicksCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"tomoueda.jpg"];
        cell.imageView.layer.borderWidth = 2;
        [cell.imageView.layer setBorderColor:[[UIColor blueColor] CGColor]];
        return cell;
    }
    else {
        return nil;
    }
}

@end
