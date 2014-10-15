//
//  GetTokyometroInfo.m
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/20.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "GetTokyometroInfo.h"

@implementation GetTokyometroInfo

@synthesize jsonObject_Station;


//クラスメソッドの実装、初期化処理
+ (id)initGetTokyometroInfo{
    return [[self alloc] init];
}

- (id)init
{
    if (self = [super init]) {
        self.jsonObject_Railway = [NSDictionary dictionary];
        self.jsonObject_Station = [NSDictionary dictionary];
    }
    return self;
}

//鉄道路線情報を取得するインスタンスメソッド
- (NSArray *) getRailwayInfo:(NSString *)key
{
    NSArray *info = [self.jsonObject_Railway valueForKeyPath:key];
    return info;
}

//駅情報を取得するインスタンスメソッド
- (NSArray *) getStationInfo:(NSString *)key;
{
    NSArray *info = [self.jsonObject_Station valueForKeyPath:key];
    return info;
}

//鉄道路線情報を取得するインスタンスメソッド
- (NSArray *) getStationIndex:(NSString *)key key2:(NSString *)key2
{
    NSArray *stationOrder = [self.jsonObject_Railway valueForKeyPath:key];
    
    NSArray *info = [NSArray array];

    //ここの処理が気に食わない（一旦保留）
    for (NSDictionary *temp in stationOrder) {
        
        info = [temp valueForKeyPath:key2];
    }
    
    return info;
}




//APIから情報を取得するメソッド
- (void) getAPI:(NSString *)url odpt:(NSString *)odpt
{
    
    NSString *urlEscapeStr = [[NSString  stringWithString:url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlEscapeStr]];
    
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *error=nil;
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:&error];

    if ([odpt isEqual:API_TYPE_STATION]) {
        self.jsonObject_Station = jsonObject;
    }
    else if ([odpt isEqual:API_TYPE_RAILWAY])
    {
        self.jsonObject_Railway = jsonObject;
    }
    
}

/*
//APIから情報を取得するメソッド
- (NSDictionary *) getAPI:(NSString *)url odpt:(NSString *)odpt
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *error=nil;
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:&error];
    
    return jsonObject;
    
}
*/


/*
- (NSArray *) getTokyometroInfo:(NSString *)odpt id:(NSString *)value
{
    
    NSString *url = [NSString stringWithFormat:@"%@datapoints?rdf:type=%@&acl:consumerKey=%@",
                     API_ENDPOINT,odpt,ACCESS_TOKEN];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *error=nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:&error];
    
    
    NSArray *main = [jsonObject valueForKeyPath:value];
    return main;
    
}
*/




@end
