//
//  AppDelegate.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//

import Firebase
import FirebaseFirestore
import Foundation


#if os(macOS)

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationWillFinishLauching(_ notification: Notification) {
        setupFirebase()
    }
}

#else

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
//                     [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
//        setupFirebase()
//        return true
//    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setupFirebase()
        return true
    }
}

#endif

fileprivate func isPreviewRuntime() -> Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEW"] == "1"
}

fileprivate func setupFirebase() {
    FirebaseApp.configure()
    if isPreviewRuntime() {
        let settings = Firestore.firestore().settings
        settings.host = "localhost:8080"
        settings.cacheSettings = MemoryCacheSettings()
        settings.isSSLEnabled = false
        Firestore.firestore().settings = settings
    }
}



//fileprivate func isDebugMode() -> Bool {
//    return _isDebugAssertConfiguration()
//}
//fileprivate func setupFirebase() {
//    FirebaseApp.configure()
//    if isPreviewRuntime() || isDebugMode() {
//        let settings = Firestore.firestore().settings
//        settings.host = "localhost:8080"
//        settings.isPersistenceEnabled = false
//        settings.isSSLEnabled = false
//        Firestore.firestore().settings = settings
//    }
//}

//fileprivate func isSimulator() -> Bool {
//    return TARGET_OS_SIMULATOR != 0
//}
//
//fileprivate func isDevice() -> Bool {
//    return TARGET_OS_SIMULATOR == 0
//}

//fileprivate func setupFirebase() {
//        FirebaseApp.configure()
//        let settings = Firestore.firestore().settings
//        
//        if isPreviewRuntime() {
//            settings.host = "localhost:8080"
//            settings.isPersistenceEnabled = false
//            settings.isSSLEnabled = false
//            print("Using Firestore Emulator (Preview Runtime)")
//        } else if isSimulator() {
//            settings.isPersistenceEnabled = true
//            settings.isSSLEnabled = true
//            print("Using Cloud Firestore (Simulator)")
//        } else if isDevice() {
//            settings.isPersistenceEnabled = true
//            settings.isSSLEnabled = true
//            print("Using Cloud Firestore (Device)")
//        } else if isDebugMode() {
//            settings.host = "localhost:8080"
//            settings.isPersistenceEnabled = false
//            settings.isSSLEnabled = false
//            print("Using Firestore Emulator (Debug Mode)")
//        }
//        
//        Firestore.firestore().settings = settings
//    }


