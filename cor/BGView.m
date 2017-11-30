//
//  BGView.m
//  cor
//
//  Created by tmp on 2017/11/29.
//  Copyright © 2017年 tmp. All rights reserved.
//

#import "BGView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define got_p6(w) ((w)/375.0f) * [[UIScreen mainScreen] bounds].size.width
#define EVE_H (ScreenHeight - got_p6(17+64))


@interface BGView()

@property (nonatomic, strong) UIImageView *imgShow;
@property (nonatomic, assign) double began_X;



@end

@implementation BGView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置锚点
        self.layer.anchorPoint = CGPointMake(0.5, 1);
        self.frame = CGRectMake(got_p6(43), got_p6(17+64), ScreenWidth - got_p6(86), EVE_H);
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [self addGestureRecognizer:panGestureRecognizer];
        
        _imgShow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - got_p6(86), got_p6(420))];
        _imgShow.backgroundColor = [UIColor yellowColor];
//        _imgShow.image = [UIImage imageNamed:@"timg1"];
//        [self addSubview:_imgShow];
   
        
    }
    return self;
}



- (void) handlePan:(UIPanGestureRecognizer*) recognizer {
    
    UIView *vv = (UIView *)self.nextResponder;
    CGPoint translation = [recognizer translationInView:vv];
    
    double ang = atan((translation.x)/EVE_H);
    _began_X = _began_X + ang;
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(_began_X);
    self.transform = transform;
    
    [recognizer setTranslation:CGPointZero inView:self];
    
//    NSLog(@"%lf", _began_X);
    
    if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
//        NSLog(@"拖拽结束");
        
        CGAffineTransform _trans = self.transform;
        CGFloat rotate = acosf(_trans.a);
        //NSLog(@"旋转角度%lf", rotate);
        if (rotate < 0.15) {
            
            ///复原
            [UIView animateWithDuration:0.15 animations:^{
                _began_X = 0;
                CGAffineTransform transform = CGAffineTransformMakeRotation(_began_X);
                self.transform = transform;
            }];
        } else {
            
            //去执行
            [UIView animateWithDuration:0.2 animations:^{
                //+为右  -为左
                if (_began_X > 0) {
                    _began_X = 1.5;
                } else {
                    _began_X = -1.5;
                }
                CGAffineTransform transform = CGAffineTransformMakeRotation(_began_X);
                self.transform = transform;
                self.alpha = 0.0;
            } completion:^(BOOL finished) {
                if (_began_X > 0) {
                    [self rightActionEnd:self];
                } else {
                    [self leftActionEnd:self];
                }
                [self finishBehind];
            }];
        }
    }
    
}



///左行结束方法
- (void)leftActionEnd:(BGView *)bgView{
    [self.delegate topViewLeftDidAction:bgView];
}

///右行结束方法
- (void)rightActionEnd:(BGView *)bgView{
    [self.delegate topViewRightDidAction:bgView];
}



- (void)finishBehind{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGAffineTransform transform = CGAffineTransformMakeRotation(0);
        self.transform = transform;
        self.began_X = 0;
        self.alpha = 1.0;
    });
    
}






@end
