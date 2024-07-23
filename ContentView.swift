////
////  ContentView.swift
////  expenseTracker
////
////  Created by Ivan Maslennikov on 16.07.2024.
////


// TODO: Add func search in "History"
// TODO: Add sort on weak, mount, today
// TODO: Func


import SwiftUI

struct ContentView: View {
    
    @State var vm = LogListViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var isAddExpensePresented = false
    
    var body: some View {
        #if os(macOS)
        splitView
        #elseif os(visionOS)
        tabView
        #else
        switch horizontalSizeClass {
        case .compact: tabView
        default: splitView
        }
        #endif
    }
    
    var tabView: some View { // for iOS
        ZStack {
            TabView {
                NavigationStack {
                    DashboardTabView()
                }
                .tabItem {
                    VStack {
                        Text("Expenses")
                        Image(systemName: "dollarsign.square")
                    }
                }
                .tag(1)
                
                NavigationStack {
                    LogListContainerView(vm: $vm)
                }
                .tabItem {
                    VStack {
                        Text("History")
                        Image(systemName: "tray")
                    }
                }
                .tag(2)
            }
            
            VStack {
                Spacer()
                VStack {
                    AddExpenseButtonView(isPresented: $isAddExpensePresented)
                }
                .padding()
            }
        }
        .sheet(isPresented: $isAddExpensePresented) {
            LogFormView(vm: .init())
        }
    }
    
    
    
    var splitView: some View { // for macOS
        NavigationSplitView {
            List {
                NavigationLink(destination: Text("Expenses")) {
                    Label("Expenses", systemImage: "dollarsign.square")
                }
                NavigationLink(destination: LogListContainerView(vm: $vm)) {
                    Label("History", systemImage: "tray")
                }
            }
        } detail: {
            LogListContainerView(vm: $vm)
        }
        .navigationTitle("Money Tracker")
    }
}

#Preview {
    ContentView()
}
