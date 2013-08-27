//
//  UIViewController+Hierarchy.h
//  Hukkster
//
//  Created by Nils Hayat on 6/28/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Hierarchy)

-(void)dismissToRootViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end
