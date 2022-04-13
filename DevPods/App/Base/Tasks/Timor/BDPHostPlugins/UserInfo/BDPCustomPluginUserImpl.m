//
//  BDPCustomPluginUserImpl.m
//  App
//
//  Created by gejunchen.ChenJr on 2022/2/18.
//

#import "BDPCustomPluginUserImpl.h"
#import <OneKit/OKServices.h>
#import <OneKit/OKServiceCenter.h>
#import <OneKit/OKApplicationInfo.h>
#import <Timor/BDPUserPluginDelegate.h>


@interface BDPCustomPluginUserImpl ()<BDPUserPluginDelegate>

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *deviceId;
@property (nonatomic, copy) NSString *sessionId;

@end

@implementation BDPCustomPluginUserImpl

+ (id<BDPBasePluginDelegate>)sharedPlugin
{
    static dispatch_once_t onceToken;
    static BDPCustomPluginUserImpl *userImpl = nil;
    dispatch_once(&onceToken, ^{
        userImpl = [[BDPCustomPluginUserImpl alloc] init];
    });
    return userImpl;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // userId & sessionId will base on your App count.
        // ths userID & sessinoId below are just for test only.
        _userId = @"123456789";
        _sessionId = @"123456789";
    }
    return self;
}

- (NSString *)bdp_appId {
    return OKApplicationInfo.sharedInstance.appID;
}

- (NSString *)bdp_deviceId {
    id<OKDeviceService> deviceService = [[OKServiceCenter sharedInstance] serviceForProtocol:@protocol(OKDeviceService)];
    return deviceService.deviceID;
}

- (void)bdp_getPhoneNumberWithParam:(NSDictionary *)param completion:(void (^)(BOOL))completion {
    completion(NO);
}

- (BOOL)bdp_isLogin {
    return YES;
}

- (void)bdp_loginWithParam:(NSDictionary *)param completion:(void (^)(BOOL, NSString *, NSString *))completion {
    completion(YES, _userId, _sessionId);
}

- (NSString *)bdp_secUserId {
    return nil;
}

- (NSString *)bdp_sessionId {
    return _sessionId;
}

- (NSString *)bdp_userId {
    return _userId;
}

@end
