//
//  AppDelegate.swift
//  xiaoji
//
//  Created by xiaotei's MacBookPro on 16/1/9.
//  Copyright © 2016年 xiaotei's MacBookPro. All rights reserved.
//

import UIKit


@UIApplicationMain



class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var reach: Reachability? //网络状态监测

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        window?.rootViewController = XTTabBarController();
        
        let initString = "appid=" + IFLYAPPID;
        IFlySpeechUtility.createUtility(initString)
        
        
        self.commonInitReachability()
        
        return true
    }
    
    func commonInitReachability()->Void{
        // Allocate a reachability object
        self.reach = Reachability.reachabilityForInternetConnection()
        
        // Tell the reachability that we DON'T want to be reachable on 3G/EDGE/CDMA
        self.reach!.reachableOnWWAN = false
        
        // Set the blocks
        self.reach!.reachableBlock = {
            (let reach: Reachability!) -> Void in
            
            // keep in mind this is called on a background thread
            // and if you are updating the UI it needs to happen
            // on the main thread, like this:
            dispatch_async(dispatch_get_main_queue()) {
                print("REACHABLE!")
            }
        }
        
        self.reach!.unreachableBlock = {
            (let reach: Reachability!) -> Void in
            print("UNREACHABLE!")
        }
        // Here we set up a NSNotification observer. The Reachability that caused the notification
        // is passed in the object parameter
//        NSNotificationCenter.defaultCenter().addObserver(self,
//            selector: "reachabilityChanged:",
//            name: kReachabilityChangedNotification,
//            object: nil)
        
        self.reach!.startNotifier()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

