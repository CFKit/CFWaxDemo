//
//  ViewController.m
//  CFWaxDemo
//
//  Created by 成飞 on 2016/10/20.
//  Copyright © 2016年 成飞. All rights reserved.
//

#import "ViewController.h"
#import "ViewController.h"
#import "wax/wax.h"
#import <Masonry.h>


@interface ViewController () {
    NSInteger _aInteger;
    CGFloat _aCGFloat;
}

@property (nonatomic, strong) UIButton *btn;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 140, 60)];
    _btn.center = self.view.center;
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn setTitle:@"更新" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"这里是一个bug");
}

#pragma mark -- 更新布局
- (void)update:(UIButton *)sender {
    [self downloadLuaFile];
    NSLog(@"更新布局中...");
}

- (void)downloadLuaFile {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *directory = [doc stringByAppendingPathComponent:@"change.lua"];
    //    NSLog(@"%@", directory);
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/change.lua"];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            if ([data writeToFile:directory atomically:YES]) {
                char *c = (char *)directory.UTF8String;
                wax_start(c, nil);
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self reloadUI];
                });
            }
        }
    }];
    [task resume];
}


- (void)reloadUI {
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.left.equalTo(self.view).offset(50);
        make.width.offset(10);
        make.height.offset(10);
    }];
    
    
}



@end
