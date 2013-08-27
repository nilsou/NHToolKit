//
//  UICollectionReusableView+Convenience.m
//  Hukkster
//
//  Created by Nils Hayat on 7/1/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import "UICollectionReusableView+Convenience.h"

@implementation UICollectionReusableView (Convenience)

+(NSString *)reuseIdentifier
{
	return [self description];
}

+(NSString *)kind
{
	return [self description];
}

@end
