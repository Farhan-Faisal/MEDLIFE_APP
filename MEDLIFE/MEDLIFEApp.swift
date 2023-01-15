//
//  MEDLIFEApp.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2022-12-30.
//
// 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

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct MEDLIFEApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
