//
//  OKMainViewController.m
//  App
//
//  Created by bytedance on 2022/2/17.
//

#import "OKMainViewController.h"

#if defined __has_include
# if __has_include("APMHomeViewController.h")
#  include "APMHomeViewController.h"
# endif
# if __has_include("BDTestIntroducerViewController.h")
#  include "BDTestIntroducerViewController.h"
# endif
# if __has_include("TTNetViewController.h")
#  include "TTNetViewController.h"
# endif
# if __has_include("OKScreenshotViewController.h")
#  include "OKScreenshotViewController.h"
# endif
# if __has_include("H5DemoListViewController.h")
#  include "H5DemoListViewController.h"
# endif
# if __has_include("BDHotfixViewController.h")
#  include "BDHotfixViewController.h"
# endif
# if __has_include("VEInstallTestViewController.h")
#  include "VEInstallTestViewController.h"
# endif
# if __has_include("TTViewController.h")
#  include "TTViewController.h"
# endif
# if __has_include("VERemoteConfigListViewController.h")
#  include "VERemoteConfigListViewController.h"
# endif

# if __has_include("BDPOKViewController.h")
#  include "BDPOKViewController.h"
# endif


#endif


@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *titleLabel;


@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = 36;
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2 -  width/2, frame.size.height/2 - width/2 - 10, width, width)];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2 - 50, frame.size.height - 30 - 5, 100, 20)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13];
        [self addSubview:self.imgView];
        [self addSubview:self.titleLabel];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 4;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        
    }
    return self;
}

@end


@interface OKMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
 
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *demoItems;

@end

@implementation OKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self setUpFeed];
}

- (void)setUpUI
{
    self.navigationItem.title = @"MARS应用框架";
    self.navigationItem.backButtonTitle = @"";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFang SC" size:16]}];
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    CGFloat spacing = 12;
    CGFloat itemWidth = (self.view.bounds.size.width - 4 * spacing)/3;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
//    layout.minimumLineSpacing = spacing;
//    layout.minimumInteritemSpacing = spacing;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    // 加内边距
    self.collectionView.contentInset = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
    self.collectionView.alwaysBounceVertical = YES;
    
    
    
    //去除文字
     [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMax) forBarMetrics:UIBarMetricsDefault];
     //设置返回图片，防止图片被渲染变蓝，以原图显示
    UIImage *backImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     [UINavigationBar appearance].backIndicatorTransitionMaskImage = backImage;
     [UINavigationBar appearance].backIndicatorImage = backImage;
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backImage;
    self.navigationController.navigationBar.backIndicatorImage = backImage;

}

- (void)setUpFeed
{
    self.demoItems = [[NSMutableArray alloc] init];
#if defined __has_include
# if __has_include("APMHomeViewController.h")
    [self.demoItems addObject:@[@"APM服务",@"notice",APMHomeViewController.class]];
# endif
# if __has_include("BDTestIntroducerViewController.h")
    [self.demoItems addObject:@[@"埋点上报",@"spot",BDTestIntroducerViewController.class]];
# endif
# if __has_include("TTNetViewController.h")
    [self.demoItems addObject:@[@"TTNet",@"download",TTNetViewController.class]];
# endif
# if __has_include("OKScreenshotViewController.h")
    [self.demoItems addObject:@[@"截屏",@"screenshot",OKScreenshotViewController.class]];
# endif
# if __has_include("H5DemoListViewController.h")
    [self.demoItems addObject:@[@"H5服务",@"h5",H5DemoListViewController.class]];
# endif
    
# if __has_include("BDHotfixViewController.h")
    [self.demoItems addObject:@[@"热修复",@"hotfix",BDHotfixViewController.class]];
# endif
    
# if __has_include("VEInstallTestViewController.h")
    [self.demoItems addObject:@[@"设备注册组件",@"debug",VEInstallTestViewController.class]];
# endif
    
# if __has_include("TTViewController.h")
    [self.demoItems addObject:@[@"发布服务",@"publish",TTViewController.class]];
# endif
    
# if __has_include("VERemoteConfigListViewController.h")
    [self.demoItems addObject:@[@"远程配置",@"config",VERemoteConfigListViewController.class]];
# endif
    
# if __has_include("BDPOKViewController.h")
    [self.demoItems addObject:@[@"小程序",@"rc1",BDPOKViewController.class]];
# endif

    
#endif
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.demoItems.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = self.demoItems[indexPath.row][0];
    cell.imgView.image = [UIImage imageNamed: self.demoItems[indexPath.row][1]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Class VC = self.demoItems[indexPath.row][2];
    UIViewController *vc = [[VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


@end
