    //
//  ViewController.h
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/20.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property NSString *lineName;
@property NSArray *LineNameArray;
@property NSArray *sameAsArray;

@property NSDictionary *jsonObject_Railway;
@property NSDictionary *jsonObject_Station;


@end
