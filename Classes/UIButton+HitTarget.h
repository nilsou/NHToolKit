//
//  UIButton+HitTarget.h
//  kapture
//
//  Created by Nils Hayat on 2/20/13.
//
//  This class allows a button to receive touches for an area bigger than it's bounds.
//  to use set hitTestEdgeInsets to a UIEdgeInset with Negative Values.
//  Example: button.hitTestEdgeInsets = UIEdgeInsetsMake(-20.0, 0.0, -20.0, 0.0)

#import <UIKit/UIKit.h>

@interface UIButton (HitTarget)

@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

@end
