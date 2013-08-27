//
//  NHKeychainHelper.h
//  Hukkster
//
//  Created by Nils Hayat on 6/18/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHKeychainHelper : NSObject

+ (NSString*)getPasswordForKey:(NSString*)key;
+ (void)setPassword:(NSString*)password forKey:(NSString*)key;
+ (void)removePasswordForKey:(NSString*)key;

@end
