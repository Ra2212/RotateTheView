//
//  BGView.h
//  cor
//
//  Created by tmp on 2017/11/29.
//  Copyright © 2017年 tmp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BGView;

@protocol BGViewDelegate <NSObject>

- (void)topViewLeftDidAction:(BGView *)topView;
- (void)topViewRightDidAction:(BGView *)topView;

@end

@interface BGView : UIView


@property (nonatomic, assign) id<BGViewDelegate>delegate;


- (void)finishBehind:(UIView *)currentV;

@end
