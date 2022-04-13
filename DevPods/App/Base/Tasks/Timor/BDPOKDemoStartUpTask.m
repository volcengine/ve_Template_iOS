//
//  BDPOKCustomStartUpTask.m
//  App
//
//  Created by gejunchen.ChenJr on 2022/2/18.
//

#import "BDPOKDemoStartUpTask.h"


#import "BDPCustomPluginLogImpl.h"
#import "BDPCustomPluginUserImpl.h"
#import "BDPCustomPluginRouterImpl.h"
#import "BDPCustomPluginApplicationImpl.h"


#import <Timor/BDPTimorClientHostPlugins.h>

OKAppTaskAddFunction() {
    [[BDPOKDemoStartUpTask new] scheduleTask];
}

@implementation BDPOKDemoStartUpTask

- (void)startWithLaunchOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions
{
    BDPTimorClientHostPlugins.sharedPlugins.logPlugin = BDPCustomPluginLogImpl.class;
    BDPTimorClientHostPlugins.sharedPlugins.userPlugin = BDPCustomPluginUserImpl.class;
    BDPTimorClientHostPlugins.sharedPlugins.routerPlugin = BDPCustomPluginRouterImpl.class;
    BDPTimorClientHostPlugins.sharedPlugins.applicationPlugin = BDPCustomPluginApplicationImpl.class;
}

@end
