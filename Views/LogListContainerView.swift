//
//  LogListContainerView.swift
//  expenseTracker
//
//  Created by Ivan Maslennikov on 17.07.2024.
//

import SwiftUI

struct LogListContainerView: View {
    
    @Binding var vm: LogListViewModel
    @State private var searchText: String = ""
    @State private var searchBarHeight: CGFloat = 0
    @State private var sortType = SortType.date
    @State private var sortOrder = SortOrder.descending
    
    var body: some View {
        VStack(spacing: 0) {
            
            FilterCategoriesView(selectedCategories: $vm.selectedCategories)
            SearchBar(text: $searchText, keyboardHeight: $searchBarHeight, placeholder: "Search expenses")
            Divider()
            SelectSortOrderView(sortType: $vm.sortType, sortOrder: $vm.sortOrder)
            Divider()
            LogListView(vm: $vm)
            
        }
        .toolbar {
            ToolbarItem {
                Button {
                    vm.isLogFormPresented = true
                } label: {
                    #if os(macOS)
                    HStack {
                        Image(systemName: "plus")
                            .symbolRenderingMode(.monochrome)
                            .tint(.accentColor)
                        Text("Add Expenses Log")
                    }
                    #else
                    Text("Add")
                    #endif
                }
            }
        }
        .sheet(isPresented: $vm.isLogFormPresented) {
            LogFormView(vm: .init())
        }
        #if !os(macOS)
        .navigationBarTitle("Money Tracker", displayMode: .inline)
        #endif
    }
}

#Preview {
    @State var vm = LogListViewModel()
    return NavigationStack {
        LogListContainerView(vm: $vm)
    }
}
