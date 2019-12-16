//
//  NewsView.swift
//  HomeWork2
//
//  Created by Pavel Antonov on 16.12.2019.
//  Copyright © 2019 OtusCourse. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    
    @EnvironmentObject var newsListViewModel: NewsListViewModel
    
    var topic: String

    var body: some View {
        NavigationView {
            List(newsListViewModel.articles) { article in
                VStack(alignment: .leading) {
                    Text(article.title ?? "")
                    if self.newsListViewModel.isNewPageLoading && self.newsListViewModel.articles.isLastItem(article) {
                        Divider()
                        Text("Loading...")
                    }
                }.onAppear {
                    self.onItemShowed(article)
                }
            }.onAppear() {
                self.newsListViewModel.pageLoad()
            }
        .navigationBarTitle(topic)
        }
    }
}

extension NewsListView {
    private func onItemShowed<T: Identifiable>(_ item: T) {
        if self.newsListViewModel.articles.isLastItem(item) {
            self.newsListViewModel.pageLoad()
        }
    }
}

extension Article: Identifiable {
    public var id: String {
        return url ?? UUID().uuidString
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(topic: "Apple").environmentObject(NewsListViewModel(topic: "Apple"))
    }
}
