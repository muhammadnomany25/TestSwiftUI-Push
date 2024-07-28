//
//  AppDelegate.swift
//  Push Notification POC
//
//

import Foundation
import UIKit

//MARK: AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    var app: Push_Notification_POCApp?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        application.registerForRemoteNotifications()
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let stringifiedToken = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("stringifiedToken:", stringifiedToken)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NotificationCenter.default.post(name: Notification.Name("NavigateToScreen"), object: "open page c")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.badge, .banner, .list, .sound]
    }
}

