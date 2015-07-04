//
//  Zuijin.m
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "Zuijin.h"
#import "MyFMDB.h"
@implementation Zuijin
-(id)initWithHanzi:(NSString *)hanzi andTime:(NSString *)time 
{
    if (self=[super init]) {
        self.hanzi=hanzi;
        self.time=time;
        
    }
    return self;
}

+(NSMutableArray *)selectAllZuijin
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select distinct hanzi from ol_zuijin order by id desc limit 8"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSString *hanzi=[result valueForKey:@"hanzi"];
//        NSString *time=[result valueForKey:@"time"];
        Zuijin *zj=[[Zuijin alloc]initWithHanzi:hanzi andTime:nil];
        [array addObject:zj];

    }
    [db close];
    return array;
}
+(BOOL)insertZuijinWithHanzi:(NSString *)hanzi andTime:(NSString *)time
{
    FMDatabase *db=[MyFMDB openDB];
    BOOL success=[db executeUpdate:@"insert into ol_zuijin (hanzi,time) values (?,?)",hanzi,time];
    [db close];
    return success;
}
+(BOOL)deleteAllZuijin
{
    FMDatabase *db=[MyFMDB openDB];
    BOOL success=[db executeUpdate:@"delete from ol_zuijin"];
    [db close];
    return success;
}
@end
