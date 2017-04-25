//
//  EG_FoldCollectionViewController.m
//  DemosGround
//
//  Created by EG on 17/3/24.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "EG_FoldCollectionViewController.h"
#import "EG_CollectionHeaderView.h"

@interface EG_FoldCollectionViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (strong, nonatomic)UICollectionView *collectionView;

@end

@implementation EG_FoldCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const headerReuseIdentifier = @"Header";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}


//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return (CGSize){SCREEN_WIDTH,50};
//}
//
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}
//
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 5.f;
//}
//
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 5.f;
//}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
//    UICollectionReusableView *reusableview =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//                                                                                 withReuseIdentifier:headerReuseIdentifier
//                                                                                        forIndexPath:indexPath];
    return   [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([EG_CollectionHeaderView class]) owner:nil options:nil].lastObject;
//    return reusableview;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, 50);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0);
//        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 20);
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
            // Register cell classes
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [_collectionView registerNib:
         [UINib nibWithNibName:NSStringFromClass([EG_CollectionHeaderView class]) bundle:nil]
         forSupplementaryViewOfKind:NSStringFromClass([EG_CollectionHeaderView class])
                        withReuseIdentifier:headerReuseIdentifier];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collectionView;
}

@end
