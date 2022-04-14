//
//  VERemoteConfigListViewController.m
//  App
//
//  Created by Ada on 2022/3/17.
//

#import "VERemoteConfigListViewController.h"
#import "VERemoteConfigViewController.h"
#import "VERemoteConfig/TestPageViewController.h"

@interface VERemoteConfigListViewController ()

@end

@implementation VERemoteConfigListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"远程配置";
    // Do any additional setup after loading the view.
}


- (NSArray<OKListCellModel *> *)models
{
    return @[[[OKListCellModel alloc] initWithTitle:@"配置发布测试页面" imageName:@"rc1" jumpVC:[TestPageViewController class]],
    [[OKListCellModel alloc] initWithTitle:@"API调用测试" imageName:@"rc2" jumpVC:[VERemoteConfigViewController class]],
    ];
}

@end
