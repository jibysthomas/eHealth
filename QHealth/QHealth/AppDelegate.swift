//
//  AppDelegate.swift
//  QHealth
//
//  Created by Anand on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit
import RESideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var tabBar: UITabBarController?
    var mainController:MainViewController!
    var firstController:FirstViewController!
    var secondController:SecondViewController!
    var activityController:QHActivityViewController!
    
    var mainNavController:UINavigationController!
    var firstNavController:UINavigationController!
    var secondNavController:UINavigationController!
    var activityNavController:UINavigationController!

    var loginController:QHLoginViewController!
    var loginNavController:UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        generatePlist()
        self.window = UIWindow(frame:UIScreen.main.bounds)
        registerLoginController()
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()

        return true
    }

    func generatePlist() {
        let theme_filePath:String = Utilities.getDocumentPathForUser() + "/" + SETTINGS_PLIST + ".plist"
        let fileManager:FileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: theme_filePath) {
            _ = CacheManager.copyFileInBundleToDocumentsFolder(fileName: SETTINGS_PLIST, fileExtension: "plist")
        }
    }
    
    func createTabController() {
        mainController = MainViewController(nibName:"MainViewController",bundle:nil)
        firstController = FirstViewController(nibName:"FirstViewController",bundle:nil)
        secondController = SecondViewController(nibName:"SecondViewController",bundle:nil)
        activityController = QHActivityViewController(nibName:"QHActivityViewController",bundle:nil)
        
        mainController.title = "My health"
        firstController.title = "Aim"
        secondController.title = "Preference"
        activityController.title = "Activity"

        mainNavController = UINavigationController()
        firstNavController = UINavigationController()
        secondNavController = UINavigationController()
        activityNavController = UINavigationController()
        
        mainNavController.viewControllers = [mainController]
        firstNavController.viewControllers = [firstController]
        secondNavController.viewControllers = [secondController]
        activityNavController.viewControllers = [activityController]
        
        let icon1 = UITabBarItem(title: "Chronicle", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        mainNavController.tabBarItem = icon1
        mainNavController.navigationBar.backgroundColor = UIColor(red: 91/255, green: 197/255, blue: 167/255, alpha: 1)
        mainNavController.navigationBar.barTintColor = UIColor(red: 0/255, green: 161/255, blue: 155/255, alpha: 1)
        mainNavController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let icon2 = UITabBarItem(title: "Aim", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        firstNavController.tabBarItem = icon2
        
        let icon3 = UITabBarItem(title: "Preference", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        secondNavController.tabBarItem = icon3
        
        let icon4 = UITabBarItem(title: "Activity", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        activityNavController.tabBarItem = icon4
        
        self.tabBar = UITabBarController()
        self.tabBar?.setViewControllers([mainNavController, secondNavController,activityNavController], animated: true)
        addSideMenu()
        //self.window?.rootViewController = tabBar
    }
    
    func getTabController()->UITabBarController {
        mainController = MainViewController(nibName:"MainViewController",bundle:nil)
        firstController = FirstViewController(nibName:"FirstViewController",bundle:nil)
        secondController = SecondViewController(nibName:"SecondViewController",bundle:nil)
        activityController = QHActivityViewController(nibName:"QHActivityViewController",bundle:nil)
        
        mainController.title = "My health"
        firstController.title = "Aim"
        secondController.title = "Preference"
        activityController.title = "Activity"
        
        mainNavController = UINavigationController()
        firstNavController = UINavigationController()
        secondNavController = UINavigationController()
        activityNavController = UINavigationController()
        
        mainNavController.viewControllers = [mainController]
        firstNavController.viewControllers = [firstController]
        secondNavController.viewControllers = [secondController]
        activityNavController.viewControllers = [activityController]
        
        let icon1 = UITabBarItem(title: "My health", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        mainNavController.tabBarItem = icon1
        mainNavController.navigationBar.backgroundColor = UIColor(red: 91/255, green: 197/255, blue: 167/255, alpha: 1)
        mainNavController.navigationBar.barTintColor = UIColor(red: 0/255, green: 161/255, blue: 155/255, alpha: 1)
        mainNavController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let icon2 = UITabBarItem(title: "Aim", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        firstNavController.tabBarItem = icon2
        
        let icon3 = UITabBarItem(title: "Preference", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        secondNavController.tabBarItem = icon3
        
        let icon4 = UITabBarItem(title: "Activity", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        activityNavController.tabBarItem = icon4
        
        self.tabBar = UITabBarController()
        self.tabBar?.setViewControllers([mainNavController, secondNavController,activityNavController], animated: true)
        //self.window?.rootViewController = tabBar
        return tabBar!
    }

    func registerLoginController() {
        loginController = QHLoginViewController(nibName:"QHLoginViewController",bundle:nil)
        loginNavController = UINavigationController()
        loginNavController.viewControllers = [loginController]
        loginNavController.navigationBar.isHidden = true
        self.window?.rootViewController = loginNavController
    }
    
    func addSideMenu() {
        let menuController = SideMenuViewController(nibName: "SideMenuViewController", bundle: nil)
        let sideMenuViewController = RESideMenu.init(contentViewController: tabBar, leftMenuViewController: menuController, rightMenuViewController: nil)
        sideMenuViewController?.backgroundImage = UIImage(named: "menuDoctor")
        sideMenuViewController?.menuPreferredStatusBarStyle = UIStatusBarStyle.default
        sideMenuViewController?.contentViewShadowColor = UIColor.black
        sideMenuViewController?.contentViewShadowOffset = CGSize(width: 0, height: 0)
        sideMenuViewController?.contentViewShadowOpacity = 0.6
        sideMenuViewController?.contentViewShadowEnabled = true
        self.window!.rootViewController = sideMenuViewController
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

