//
//  LYNetworkCache.m
//  LYProject
//
//  Created by 李营 on 2018/9/20.
//  Copyright © 2018年 liying. All rights reserved.
//

#import "LYNetworkCache.h"
#import <YYCache.h>

static NSString *const kLYNetworkResponseCache = @"kLYNetworkResponseCache";

@implementation LYNetworkCache
static YYCache *_dataCache;

+ (void)initialize{
    _dataCache = [YYCache cacheWithName:kLYNetworkResponseCache];
}

+ (void)setHttpCache:(id)httpData URL:(NSString *)URL parameters:(NSDictionary *)parameters{
    NSString *cacheKey = [self cacheKeyWithUrl:URL parameters:parameters];
    //异步缓存，不会阻塞主线程
    [_dataCache setObject:httpData forKey:cacheKey withBlock:nil];
}

+ (id)httpCacheForURL:(NSString *)URL parameters:(NSDictionary *)parameters{
    NSString *cacheKey = [self cacheKeyWithUrl:URL parameters:parameters];
    return [_dataCache objectForKey:cacheKey];
}

+ (NSInteger)getAllHttpCacheSize{
    return [_dataCache.diskCache totalCost];
}

+ (void)removeAllHttpCache{
    [_dataCache.diskCache removeAllObjects];
}

+ (NSString *)cacheKeyWithUrl:(NSString *)url parameters:(NSDictionary *)parameters{
    if (!parameters || parameters.count == 0) {
        return url;
    }
    NSData *stringData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    NSString *paraString = [[NSString alloc]initWithData:stringData encoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:@"%@%@",url,paraString];
}

@end
