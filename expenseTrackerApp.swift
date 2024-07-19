//
//  expenseTrackerApp.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 16.07.2024.
//


import SwiftUI
import Firebase

@main
struct expenseTrackerApp: App {
    
    #if os(macOS)
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    #else
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    #endif
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(macOS)
                .frame(minWidth: 729, minHeight: 480)
            #endif
        }
        #if os(macOS)
        .windowResizability(.contentMinSize)
        #endif
    }
}
