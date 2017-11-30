//
//  ViewController.m
//  cor
//
//  Created by tmp on 2017/11/29.
//  Copyright © 2017年 tmp. All rights reserved.
//

#import "ViewController.h"
#import "RoView.h"

@interface ViewController ()

@property (nonatomic, strong) RoView *imgCover;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _imgCover = [[RoView alloc] init];
    _imgCover.frame = self.view.bounds;
    [self.view addSubview:_imgCover];
    _imgCover.userInteractionEnabled = YES;

    
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
