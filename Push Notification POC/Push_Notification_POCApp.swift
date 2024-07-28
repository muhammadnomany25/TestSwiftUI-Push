//
//  Push_Notification_POCApp.swift
//  Push Notification POC
//
//

import SwiftUI

//MARK: Swiftui entry
@main
struct Push_Notification_POCApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject var notificationManager = NotificationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    appDelegate.app = self
                    Task{
                        await notificationManager.request()
                    }
                }
        }
    }
}
