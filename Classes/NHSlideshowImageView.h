//
//  NHSlideshowImageView.h
//
//  Created by Nils Hayat on 8/22/13.
//  Copyright (c) 2013 Nils Hayat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHSlideshowImageView : UIImageView

@property (nonatomic,copy) NSArray *images;
@property (nonatomic) NSTimeInterval rotationDuration;

@end
