//
//  AppDelegate.m
//  iPadSalesforce
//
//  Created by John Pope on 1/19/17.
//  Copyright © 2017 ios. All rights reserved.
//

#import "AppDelegate.h"
#import "zkSforceClient.h"
#import "zkSoapException.h"
#import "SFVAsync.h"

@interface AppDelegate ()
{
    ZKSforceClient *client;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    @try {
        [SFVAsync performSFVAsyncRequest:(id) ^ {
            
            
            
             client = [[ZKSforceClient alloc] init] ;
            @try {
                
                // THIS WORKS
                // [client login:@"youremail@email.com" password:@"correctUsernameSecurityToken"];
                
                
                
                // This will CRASH!!
                [client login:@"youremail@email.com" password:@"incorrectUsernameSecurityToken"];
            

            } @catch (ZKSoapException *ex) {
                NSLog(@"login failed %@", [ex reason]);
                // show to user etc, whatever you want to do when login fails.
            }

            
        } failBlock: ^(NSException *e) {
            NSLog(@"e:%@", e);

        } completeBlock: ^(id result) {
            NSLog(@"results:%@", result);
        }];
    }
    @catch (NSException *exception)
    {
        NSLog(@"exception - couldn't login:%@", exception);
    }
    @finally
    {
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
