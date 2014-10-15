//
//  TimeTableViewController.m
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/28.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "TimeTableViewController.h"
#import "GetTokyometroInfo.h"

@interface TimeTableViewController ()

@end

@implementation TimeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //ラベルの表示
    self.label.text = [NSString stringWithFormat:@"%@駅",self.stationName];
    
    //画像の表示
    NSString *imgName = [NSString stringWithFormat:@"tokyometro%d.png", self.stationNo];
    UIImage *image = [UIImage imageNamed:imgName];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    CGRect rect = CGRectMake(0, 0, 30, 30);
    imageView.frame = rect;

    [self.image addSubview:imageView];
    
    
    
    
    // デリゲートメソッドをこのクラスで実装する
    [self.timeTableView setDelegate:self];
    [self.timeTableView setDataSource:self];
    [self.timeTableView setAllowsMultipleSelection:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Table Viewの行数を返す
    return 20;
}

//テーブルに表示させる処理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Table Viewの各行の情報を、UITableViewCellのオブジェクトとして返す
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%d",indexPath.row + 5];
    return cell;
}

//テーブルが選択されたときの処理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択されたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // セルのアクセサリにチェックマークを指定
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

// セルの選択がはずれた時に呼び出される
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択がはずれたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // セルのアクセサリを解除する（チェックマークを外す）
    cell.accessoryType = UITableViewCellAccessoryNone;
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
