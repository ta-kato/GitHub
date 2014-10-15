//
//  CustomTableViewCell.m
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/10/01.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


+ (CGFloat)rowHeight
{
    return 70.0f;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
