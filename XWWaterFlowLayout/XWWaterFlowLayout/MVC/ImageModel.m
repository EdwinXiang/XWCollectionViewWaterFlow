//
//  ImageModel.m
//  WaterFlow
//
//  Created by Edwin on 15/12/27.
//  Copyright © 2015年 EdwinXiang. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

+(NSMutableArray *)parasingDataFromDic:(NSDictionary *)dic{
    
    NSMutableArray *dataArr = [NSMutableArray array];
    NSArray *Array = [dic objectForKey:@"data"];
    for (NSDictionary *dic in Array) {
        ImageModel *model = [[ImageModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [dataArr addObject:model];
    }
    
    return dataArr;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
