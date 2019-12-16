//
//  NewsListViewModel.swift
//  HomeWork2
//
//  Created by Pavel Antonov on 16.12.2019.
//  Copyright © 2019 OtusCourse. All rights reserved.
//

import Foundation

final class NewsListViewModel: ObservableObject {

    @Published private(set) var articles: [Article] = []
    @Published private(set) var pageIndex: Int = 0
    @Published private(set) var isNewPageLoading = false
    
    private var topic: String
    
    init(topic: String) {
        self.topic = topic
    }
    
    func pageLoad() {
        guard isNewPageLoading == false else { return }
        isNewPageLoading = true
        self.pageIndex += 1
        
        ArticlesAPI.everythingGet(q: topic, from: "2019-12-01", sortBy: "publishedAt", apiKey: "428cdc3ea75045248447b7f8c444d298", page: pageIndex) { list, error in
            if let error = error {
                print("\(error)")
                self.pageIndex -= 1
            } else {
                self.articles.append(contentsOf: list?.articles ?? [])
            }
            self.isNewPageLoading = false
        }
    }
    
}


