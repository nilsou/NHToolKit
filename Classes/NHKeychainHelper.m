//
//  NHKeychainHelper.m
//  Hukkster
//
//  Created by Nils Hayat on 6/18/13.
//  Copyright (c) 2013 Hukkster. All rights reserved.
//

#import "NHKeychainHelper.h"
#import <Security/Security.h>

@interface NHKeychainHelper ()
+ (NSMutableDictionary*)dictionaryForKey:(NSString*)key;
@end

@implementation NHKeychainHelper
static const NSString *SERVICE_NAME = @"com.hukkster.hukkster";

+ (NSMutableDictionary*)dictionaryForKey:(NSString*)aKey
{
    NSData *encodedKey = [aKey dataUsingEncoding:NSUTF8StringEncoding];
	
    NSMutableDictionary *searchDictionary = [NSMutableDictionary dictionary];
	
    [searchDictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [searchDictionary setObject:encodedKey forKey:(__bridge id)kSecAttrGeneric];
    [searchDictionary setObject:encodedKey forKey:(__bridge id)kSecAttrAccount];
    [searchDictionary setObject:SERVICE_NAME forKey:(__bridge id)kSecAttrService];
	
    return searchDictionary;
}

+ (NSString*)getPasswordForKey:(NSString*)aKey
{
    NSString *password = nil;
	
    NSMutableDictionary *searchDictionary = [self dictionaryForKey:aKey];
    [searchDictionary setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [searchDictionary setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
	
    CFDataRef cfresult = NULL;
    SecItemCopyMatching((__bridge CFDictionaryRef)searchDictionary, (CFTypeRef *)&cfresult);
	
	NSData *result = (__bridge_transfer NSData *)cfresult;
	
    if (result)
    {
        password = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return password;
}

+ (void)removePasswordForKey:(NSString*)aKey
{
    NSMutableDictionary *keyDictionary = [self dictionaryForKey:aKey];
    SecItemDelete((__bridge CFDictionaryRef)keyDictionary);
}

+ (void)setPassword:(NSString*)aPassword forKey:(NSString*)aKey
{
    [NHKeychainHelper removePasswordForKey:aKey];
	
    NSData *encodedPassword = [aPassword dataUsingEncoding:NSUTF8StringEncoding];
	
    NSMutableDictionary *keyDictionary = [self dictionaryForKey:aKey];
    [keyDictionary setObject:encodedPassword forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keyDictionary, nil);
}

@end
