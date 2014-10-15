//
//  StationNameViewController.m
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/20.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "StationNameViewController.h"
#import "TimeTableViewController.h"
#import "GetTokyometroInfo.h"
#import "AppDelegate.h"


@interface StationNameViewController ()

@end

@implementation StationNameViewController
@synthesize NavigationBar;
@synthesize stationTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //タイトルの表示
    NavigationBar.topItem.title = [NSString stringWithFormat:@"%@線",self.lineName];
    
    //運行系統名を取得する
    NSString *railway =[NSString stringWithFormat:@"&odpt:railway=%@",self.railwayArray];
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@",
                     API_ENDPOINT,API_TYPE_STATION,railway,ACCESS_TOKEN];
    
    GetTokyometroInfo *getStationInfo = [GetTokyometroInfo initGetTokyometroInfo];
    [getStationInfo getAPI:url odpt:API_TYPE_STATION];
    
    railway =[NSString stringWithFormat:@"&dc:title=%@",self.lineName];
    url = [NSString stringWithFormat:@"%@%@%@%@",
           API_ENDPOINT,API_TYPE_RAILWAY,railway,ACCESS_TOKEN];
    
    GetTokyometroInfo *getStationNo = [GetTokyometroInfo initGetTokyometroInfo];
    [getStationNo getAPI:url odpt:API_TYPE_RAILWAY];
    
    
    //駅名の取得
    NSArray *title = [getStationInfo getStationInfo:@"dc:title"];
    NSArray *sameAs = [getStationInfo getStationInfo:@"owl:sameAs"];
    
    NSArray *index = [getStationNo getStationIndex:@"odpt:stationOrder" key2:@"odpt:index"];
    NSArray *station = [getStationNo getStationIndex:@"odpt:stationOrder" key2:@"odpt:station"];
    
    NSMutableDictionary *stationName = [NSMutableDictionary dictionary];
    NSMutableDictionary *stationIndex = [NSMutableDictionary dictionary];
    
    
    int i;
    for (i = 0; i < [title count]; i++) {
        [stationName setObject:[title objectAtIndex:i] forKey:[sameAs objectAtIndex:i]];
        //NSLog(@"index: %d, value: %@ key: %@\n", i, [title objectAtIndex:i], [sameAs objectAtIndex:i]);
    }
    
    for (i = 0; i < [index count]; i++) {
        [stationIndex setObject:[station objectAtIndex:i] forKey:[index objectAtIndex:i]];
        //NSLog(@"index: %d, value: %@ key: %@\n", i, [station objectAtIndex:i], [index objectAtIndex:i]);
    }
    
    //駅名の並び替え
    NSMutableArray *nameArray = [[NSMutableArray alloc] init];
    NSMutableArray *stationArray = [[NSMutableArray alloc] init];
    for (i = 0; i < [stationIndex count]; i++) {

        //int型はNSMutableDictionaryのキーには利用出来ないため、NSNumber型に変換する
        NSNumber *num = [NSNumber numberWithInt:i];
        
        NSString *station = [stationIndex objectForKey:num];
        NSString *name = [stationName objectForKey:station];
        
        [nameArray addObject:name];
        [stationArray addObject:station];
        
    }
    _stationNameArray = nameArray;
    _stationIdArray = stationArray;
    
    [stationTableView setDelegate:self];
    [stationTableView setDataSource:self];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Table Viewの行数を返す
    return _stationNameArray.count;
}


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
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@駅", _stationNameArray[indexPath.row]];
    
    
    NSString *imgName = [NSString stringWithFormat:@"stationIcon_0%d.png", self.railwayNo];
    cell.imageView.image = [UIImage imageNamed:imgName];
    
    return cell;
}


//セルが選択された際の画面遷移処理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TimeTableViewController *timeTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"timeTableViewController"];
    
    timeTableVC.railDirection = _stationIdArray;
    timeTableVC.stationName = _stationNameArray[indexPath.row];
    timeTableVC.stationNo = _railwayNo;
    
    [self presentViewController:timeTableVC animated:YES completion:nil];
    //[self.navigationController pushViewController:timeTableVC animated:YES];

    /*pushで画面遷移をさせる方法が分からない
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController pushViewController:timeTableVC animated:YES];
     */
    
    
}

//戻るボタンを押した際の処理
- (IBAction)unwindToStationNameVC:(UIStoryboardSegue *)segue
{
    //駅名リスト画面から戻るボタンを押したときに呼び出される
    //中は空でよい
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
