//
//  GetTokyometroInfo.h
//  TokyoMetro_TimeTable
//
//  Created by 加藤 隆義 on 2014/09/20.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetTokyometroInfo : NSObject

//東京メトロAPL
#define API_ENDPOINT @"https://api.tokyometroapp.jp/api/v2/datapoints?"

//コンテンツ
#define API_TYPE_TRAIN @"rdf:type=odpt:Train"
#define API_TYPE_STATION @"rdf:type=odpt:Station"
#define API_TYPE_RAILWAY @"rdf:type=odpt:Railway"
#define API_TYPE_RAIL_WAY_FARE @"rdf:type=odpt:RailwayFare"
#define API_TYPE_STATION_FACILITY @"rdf:type=odpt:StationFacility"
#define API_TYPE_PASSENGER_SURVEY @"rdf:type=odpt:PassengerSurvey"
#define API_TYPE_STATION_TIMETABLE @"rdf:type=odpt:StationTimetable"
#define API_TYPE_TRAIN_INFORMATION @"rdf:type=odpt:TrainInformation"

//アクセストークン
#define ACCESS_TOKEN @"&acl:consumerKey=c19f5b787617b84bb3c05e1ed4ad0600dee7ceec3bfdf3685e28427051f80212"


@property NSDictionary *jsonObject_Railway;
@property NSDictionary *jsonObject_Station;

+ (id)initGetTokyometroInfo;
- (id)init;

- (NSArray *) getRailwayInfo:(NSString *)value;
- (NSArray *) getStationInfo:(NSString *)value;
- (NSArray *) getStationIndex:(NSString *)value key2:(NSString *)value2;

- (void) getAPI:(NSString *)url odpt:(NSString *)odpt;


@end
