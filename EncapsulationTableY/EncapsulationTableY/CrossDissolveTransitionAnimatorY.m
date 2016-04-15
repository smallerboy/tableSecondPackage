//
//  CrossDissolveTransitionAnimatorY.m
//  EncapsulationTableY
//
//  Created by 张一力 on 16/3/17.
//  Copyright © 2016年 张一力. All rights reserved.
//

#import "CrossDissolveTransitionAnimatorY.h"

@implementation CrossDissolveTransitionAnimatorY

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 10;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController * toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = transitionContext.containerView;
    
    UIView * fromView;
    UIView * toVIew;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toVIew = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else{
        fromView = fromViewController.view;
        toVIew = toViewController.view;
    }
    
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toVIew.frame = [transitionContext finalFrameForViewController:toViewController];
    
    fromView.alpha = 1.0f;
    
    toVIew.alpha = 0.0f;
    
    [containerView addSubview:toVIew];
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:transitionDuration animations:^{
        fromView.alpha = 0.0f;
        toVIew.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:wasCancelled];
    }];
    
}

@end
