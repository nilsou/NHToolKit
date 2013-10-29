//
//  NHSlideshowImageView.m
//
//  Created by Nils Hayat on 8/22/13.
//  Copyright (c) 2013 Nils Hayat. All rights reserved.
//

#import "NHSlideshowImageView.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface NHSlideshowImageView ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) NSUInteger indexOrImagesBeingDisplayed;;

@end

@implementation NHSlideshowImageView

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
    _imageURLs = nil;
    
	if (images.count > 0) {
		self.image = images[0];
	}
	
	[self setupTimer];
}

-(void)setImageURLs:(NSArray *)imageURLs {
    _imageURLs = [imageURLs copy];
    _images = nil;
    
    if (imageURLs.count > 0) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:imageURLs[0]]];
        [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
        
        __weak typeof(self) wself = self;
        
        [self setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            wself.image = image;
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            
        }];
    }
}

-(void)setRotationDuration:(NSTimeInterval)rotationDuration
{
	_rotationDuration = rotationDuration;
	[self setupTimer];
}

-(void)displayNextImage
{
    NSUInteger index;
    NSUInteger nextIndex;
    
    if (self.images) {
        index = self.indexOrImagesBeingDisplayed;
        nextIndex = (index+1) % self.images.count;
        
        UIImage *nextImage = self.images[nextIndex];
        
        [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.image = nextImage;
        } completion:^(BOOL finished) {
            
        }];
    } else if (self.imageURLs) {
        NSUInteger index = self.indexOrImagesBeingDisplayed;
        NSUInteger nextIndex = (index+1) % self.imageURLs.count;
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.imageURLs[nextIndex]]];
        [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
        
        __weak typeof(self) wself = self;
        
        [self setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            [UIView transitionWithView:wself
                              duration:0.5
                               options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionBeginFromCurrentState
                            animations:^{
                                wself.image = image;
                            } completion:^(BOOL finished) {
                                
                            }];
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            
        }];
    }
    
    self.indexOrImagesBeingDisplayed  = nextIndex;
}

@end
