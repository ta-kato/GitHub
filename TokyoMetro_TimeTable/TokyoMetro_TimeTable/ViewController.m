//
//  ViewController.m
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/20.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"
#import "GetTokyometroInfo.h"
#import "StationNameViewController.h"

@interface ViewController();

@end

@implementation ViewController
@synthesize myCollectionView;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //APIから鉄道路線情報を取得する
    NSString *url = [NSString stringWithFormat:@"%@%@%@",
                     API_ENDPOINT,API_TYPE_RAILWAY,ACCESS_TOKEN];
    
    GetTokyometroInfo *getRailwayInfo = [GetTokyometroInfo initGetTokyometroInfo];
    //NSDictionary *railwayJsonObject = [getTokyometroInfo getAPI:url odpt:API_TYPE_RAILWAY];
    [getRailwayInfo getAPI:url odpt:API_TYPE_RAILWAY];

    //運行系統名、固有識別子を取得する
    _LineNameArray = [getRailwayInfo getRailwayInfo:@"dc:title"];
    _sameAsArray = [getRailwayInfo getRailwayInfo:@"owl:sameAs"];
    
    
    [myCollectionView setDataSource:self];
    [myCollectionView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
//APIから取得されたJsonデータからキーをもとに情報を取得する
- (NSArray *) getJsonData:(NSDictionary *)jsonObject key:(NSString *)key
{
    NSArray *info = [jsonObject valueForKeyPath:key];
    return info;
}
*/



#pragma mark -collection view delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //セッション数1
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    //アイテム数9
    return 9;
}


//Method to create cell at index path
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    
    //ラベルに表示
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%@線",_LineNameArray[indexPath.row+1]];
    
    //画像の表示
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:2];
    NSString *imgName = [NSString stringWithFormat:@"tokyometro%d.png", (int)(indexPath.row+1)];
    UIImage *image = [UIImage imageNamed:imgName];
    imageView.image = image;
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //クリックされたらよばれる
    NSLog(@"Clicked %d-%d",indexPath.section,indexPath.row);

    //セグエを使わない画面遷移処理
    StationNameViewController *stasionNameVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stationNameViewController"];
    stasionNameVC.lineName = _LineNameArray[indexPath.row+1];
    stasionNameVC.railwayArray = _sameAsArray[indexPath.row+1];
    stasionNameVC.railwayNo = indexPath.row+1;
    
    [self presentViewController:stasionNameVC animated:YES completion:nil];
    //[self.navigationController pushViewController:stasionNameVC animated:YES];

}

/*
 //セグエを使った画面遷移
 //※collectionViewがクリックされるよりも先にこちらが呼び出されるため、self.lineNameに線名が入らない。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"OpenStationNameList"]) {
        StationNameViewController *secondViewController = segue.destinationViewController;

        secondViewController.lineName = self.lineName;
    }
}
*/


- (IBAction)unwindToVC:(UIStoryboardSegue *)segue
{
    //駅名リスト画面から戻るボタンを押したときに呼び出される
    //中は空でよい
}

@end
