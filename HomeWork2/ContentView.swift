//
//  ContentView.swift
//  HomeWork2
//
//  Created by Pavel Antonov on 16.12.2019.
//  Copyright © 2019 OtusCourse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NewsListView().environmentObject(NewsListViewModel(topic: "Apple"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
