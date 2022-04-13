//
//  BDPOKViewController.m
//  App
//
//  Created by gejunchen.ChenJr on 2022/2/18.
//

#import "BDPOKViewController.h"

#import "BDPOKScanCodeViewController.h"
#import <Timor/BDPTimorClient.h>
#import <OneKit/ByteDanceKit.h>


@interface BDPOKViewController ()

@end

@implementation BDPOKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"小程序 demo";
    [self setupItems];
    // Do any additional setup after loading the view.
}

- (void)setupItems
{
    [self.view addSubview:[self generateButtonWithName:@"扫码打开小程序" top:100 action:@selector(scanCode)]];
}

- (void)scanCode
{
    [self.navigationController pushViewController:[BDPOKScanCodeViewController new] animated:YES];
}


# pragma mark - helpers

- (UIButton *)generateButtonWithName:(NSString *)name top:(CGFloat)top action:(SEL)action {
    CGRect fullBound = [UIScreen mainScreen].bounds;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake((fullBound.size.width - 300) / 2, top, 300, 50);
    [button setTitle:name forState:UIControlStateNormal];
    button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
