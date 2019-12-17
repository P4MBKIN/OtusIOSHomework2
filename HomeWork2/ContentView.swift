//
//  ContentView.swift
//  HomeWork2
//
//  Created by Pavel Antonov on 16.12.2019.
//  Copyright © 2019 OtusCourse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
    @State private var topics = ["Apple", "bitcoin", "Microsoft"]
    
    var body: some View {
        VStack {
            Picker("Topics", selection: $selectedIndex) {
                ForEach(0 ..< topics.count) { index in
                    Text(self.topics[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TabView(selection: $selectedIndex) {
                NewsListView().environmentObject(NewsListViewModel(topic: topics[selectedIndex]))
                    .tabItem {
                        EmptyView()
                }.tag(0)
                NewsListView().environmentObject(NewsListViewModel(topic: topics[selectedIndex]))
                    .tabItem{
                        EmptyView()
                }.tag(1)
                NewsListView().environmentObject(NewsListViewModel(topic: topics[selectedIndex]))
                    .tabItem{
                        EmptyView()
                }.tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
