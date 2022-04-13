//
//  BDPCustomPluginApplicationImpl.m
//  App
//
//  Created by gejunchen.ChenJr on 2022/2/18.
//

#import "BDPCustomPluginApplicationImpl.h"
#import <Timor/BDPApplicationPluginDelegate.h>
#import <OneKit/OKApplicationInfo.h>

@interface BDPCustomPluginApplicationImpl () <BDPApplicationPluginDelegate>

@end

@implementation BDPCustomPluginApplicationImpl

+ (id<BDPBasePluginDelegate>)sharedPlugin {
    static id<BDPBasePluginDelegate> instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (NSDictionary *)bdp_registerApplicationInfo {
    return @{
        BDPAppNameKey : OKApplicationInfo.sharedInstance.appName,
        BDPAppVersionKey : OKApplicationInfo.sharedInstance.appVersion,
    };
}

- (NSDictionary *)bdp_registerSceneInfo {
    return nil;
}

@end
