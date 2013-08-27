//
//  UICollectionViewCell+Convenience.m
//  Hukkster
//
//  Created by Nils Hayat on 7/1/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import "UICollectionViewCell+Convenience.h"

@implementation UICollectionViewCell (Convenience)

+(NSString *)reuseIdentifier
{
	return [self description];
}

@end
