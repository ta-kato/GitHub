//
//  TimeTableViewController.h
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/28.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTableViewController : UIViewController< UITableViewDataSource, UITableViewDelegate >
@property (weak, nonatomic) IBOutlet UITableView *timeTableView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property NSArray *railDirection;
@property NSString *stationName;
@property int stationNo;
@property NSArray *timeTable;

@end
