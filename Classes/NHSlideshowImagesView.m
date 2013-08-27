//
//  NHSlideshowImagesView.m
//
//  Created by Nils Hayat on 8/22/13.
//  Copyright (c) 2013 Nils Hayat. All rights reserved.
//

#import "NHSlideshowImagesView.h"

@interface NHSlideshowImagesView ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation NHSlideshowImagesView

-(void)setupTimer
{
	if (self.timer) {
		[self.timer invalidate];
		self.timer = nil;
	}
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval:self.rotationDuration target:self selector:@selector(displayNextImage) userInfo:nil repeats:YES];
}

-(void)setImages:(NSArray *)images
{
	_images = [images copy];
	if (images.count > 0) {
		self.image = images[0];
	}
	
	[self setupTimer];
}

-(void)displayNextImage
{
	NSUInteger index = [self.images indexOfObject:self.image];
	
	UIImage *nextImage = self.images[(index+1) % self.images.count];
	
	[UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
		self.image = nextImage;
	} completion:^(BOOL finished) {
		
	}];
}

@end
