//
//  StationNameViewController.h
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/20.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationNameViewController : UIViewController< UITableViewDataSource, UITableViewDelegate >

@property (weak, nonatomic) IBOutlet UITableView *stationTableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *NavigationBar;
@property NSArray *stationNameArray;
@property NSArray *stationIdArray;
@property NSArray *stationNo;
@property int railwayNo;
@property NSArray *railwayArray;

@property NSString *lineName;

@end
