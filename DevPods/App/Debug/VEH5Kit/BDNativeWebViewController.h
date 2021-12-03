//
//  BDNativeWebViewController.h
//  App
//
//  Created by bytedance on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, BDNativeWebViewControllerType) {
    BDNativeWebViewControllerTypeImage,
    BDNativeWebViewControllerTypeVideo,
};

@interface BDNativeWebViewController : UIViewController

@property (nonatomic,assign) BDNativeWebViewControllerType  type;

@end

NS_ASSUME_NONNULL_END
