//
//  BDNativeWebViewController.m
//  App
//
//  Created by bytedance on 2021/12/3.
//

#import "BDNativeWebViewController.h"
#import <BDNativeWebComponentToB/WKWebView+BDNative.h>
#import <BDNativeWebComponentToB/BDNativeLogManager.h>
#import <BDNativeWebComponentToB/BDNativeImageComponent.h>
#import <BDNativeWebComponentToB/BDNativeVideoComponent.h>
#import <OneKit/UIView+BTDAdditions.h>

@interface BDNativeWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, weak) UIViewController *bPage;


@end

@implementation BDNativeWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.webView enableNativeWithComponents:@[
        [BDNativeImageComponent class],
        [BDNativeVideoComponent class]
    ]];
    [[NSUserDefaults standardUserDefaults] synchronize];

    if (self.type == BDNativeWebViewControllerTypeImage) {
//        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://0.0.0.0:8090/native-image.html"]]];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://mars-jsbridge.vemarsdev.com/native-image.html"]]];


    }else{
//        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://0.0.0.0:8090/native-video.html"]]];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://mars-jsbridge.vemarsdev.com/native-video.html"]]];

    }
    
    [[BDNativeLogManager sharedInstance] configLogBlock:^(NSString * _Nonnull log) {
        NSLog(log);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navigationBarDidClicked)];
    [self.navigationController.navigationBar addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}

#pragma mark - initlize getter
- (WKWebView *)webView
{
    if (!_webView)
    {
        
        CGRect rect = CGRectMake(0, UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + 44, self.view.bounds.size.width, self.view.bounds.size.height - UIApplication.sharedApplication.keyWindow.btd_safeAreaInsets.bottom - UIApplication.sharedApplication.keyWindow.btd_safeAreaInsets.top - 94);
        
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:rect configuration:configuration];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
        self.webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    }
    return _webView;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [self.webView clearNativeComponent];
}

#pragma mark - private method
- (void)navigationBarDidClicked
{
   
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
}

- (void)dealloc
{

}

@end
