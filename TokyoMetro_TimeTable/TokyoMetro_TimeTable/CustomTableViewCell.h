//
//  CustomTableViewCell.h
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/10/01.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const TableViewCustomCellIdentifier = @"TableViewCustomCell";


@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *cellNo;

+ (CGFloat)rowHeight;

@end
