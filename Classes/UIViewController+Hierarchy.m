//
//  UIViewController+Hierarchy.m
//  Hukkster
//
//  Created by Nils Hayat on 6/28/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import "UIViewController+Hierarchy.h"

@implementation UIViewController (Hierarchy)

-(void)dismissToRootViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
	UIViewController *viewController = self;
	while (viewController.presentingViewController) {
		viewController = viewController.presentingViewController;
	}
	
	[viewController dismissViewControllerAnimated:animated completion:completion];
}

@end
