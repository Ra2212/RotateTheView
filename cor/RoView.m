//
//  RoView.m
//  cor
//
//  Created by tmp on 2017/11/29.
//  Copyright © 2017年 tmp. All rights reserved.
//

#import "RoView.h"
#import "BGView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define got_p6(w) ((w)/375.0f) * [[UIScreen mainScreen] bounds].size.width

#define EVE_H (ScreenHeight - got_p6(17+64))

@interface RoView()<BGViewDelegate>

@property (nonatomic, strong) BGView *bgView1;
@property (nonatomic, strong) BGView *bgView2;

@end

@implementation RoView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        //视图1
        _bgView1 = [[BGView alloc] init];
        _bgView1.backgroundColor = [UIColor redColor];
        _bgView1.delegate = self;
        [self addSubview:_bgView1];
        
        
        
        //视图2
        _bgView2 = [[BGView alloc] init];
        _bgView2.backgroundColor = [UIColor greenColor];
        _bgView2.delegate = self;
        [self addSubview:_bgView2];
        

        
    }
    return self;
}








- (void)topViewLeftDidAction:(BGView *)topView{
    NSLog(@"左行结束");
    
    if (topView == self.bgView1) {
        [self bringSubviewToFront:self.bgView2];
    } else {
        [self bringSubviewToFront:self.bgView1];
    }
    
    [topView finishBehind:topView];
}

- (void)topViewRightDidAction:(BGView *)topView{
    NSLog(@"右行结束");
    
    if (topView == self.bgView1) {
        [self bringSubviewToFront:self.bgView2];
    } else {
        [self bringSubviewToFront:self.bgView1];
    }
    [topView finishBehind:topView];
}




@end
