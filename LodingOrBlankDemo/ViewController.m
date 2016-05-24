//
//  ViewController.m
//  LodingOrBlankDemo
//
//  Created by admin on 16/5/23.
//  Copyright © 2016年 LZZ. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LZLodingOrBlank.h"
@interface ViewController ()
{
    LZBlankPageView *_blankView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    
    [self sendRequest];
   
}
-(void)sendRequest{
    [self.view beginLoading];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
       
        NSDictionary *dic = nil;
        /**
         Type 1
         */
    //   [self showBlankPageWithType:LZBlankPageTypeNoData reloadButtonBlock:nil];
        
        /**
         Type 2
         */
        [self.view configBlankPage:LZBlankPageTypeNetError hasData:(dic)  reloadButtonBlock:^(id sender) {
            [self sendRequest];
        }];
        
        });

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showBlankPageWithType:(LZBlankPageType)type reloadButtonBlock:(void (^)(id))block{
    [self dismissBlankPage];
    _blankView=[[LZBlankPageView alloc] initWithFrame:CGRectZero];
    [_blankView configWithType:LZBlankPageTypeNoData hasData:NO reloadButtonBlock:block];
    [self.view addSubview:_blankView];
    
    [_blankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.size.equalTo(self.view);
        
    }];
    self.view.userInteractionEnabled=YES;
}
-(void)dismissBlankPage{
    if (_blankView) {
        [_blankView removeFromSuperview];
          _blankView=nil;
    }
}
@end
