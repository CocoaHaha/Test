//
//  webView.m
//  StatusBar
//
//  Created by 石向锋 on 2017/6/16.
//  Copyright © 2017年 CocoHaHa. All rights reserved.
//

#import "webView.h"

#import <JavaScriptCore/JavaScriptCore.h>//系统支持库

@protocol JSObjcDelegate <JSExport>//定义web与JS交互的协议
-(void)goToNextActivity:(NSString *)urlStr;//JS需要调用的方法，参数可有可无，根据需要设定
@end

@interface webView ()<UIWebViewDelegate,JSObjcDelegate>//遵守协议
@property (nonatomic,strong)JSContext * jsContext;//创建JSContext对象 我把它当作上下文对象，用于连接JS和OC


@end

@implementation webView

-(instancetype)initWithFrame:(CGRect)frame url:(NSURL *)url{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        self.delegate = self;
        
        [self loadRequest:request];
    }
    
    return self;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.jsContext[@"myObj"] = self;//这里把self赋值给self.jsContext的myObj对象，那么在JS中就可以通过myObj调用oc方法了
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
    
}


//webview调用方法
-(void)goToNextActivity:(NSString *)urlStr{
    
    NSLog(@"goToNextActivity str:%@",urlStr);
    
    
}

 

@end
