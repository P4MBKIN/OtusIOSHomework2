//
//  ArticleView.swift
//  HomeWork2
//
//  Created by Pavel Antonov on 16.12.2019.
//  Copyright © 2019 OtusCourse. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0){
            Text(article.title ?? "Unknowned title")
                .font(.title)
            HStack(alignment: .center, spacing: 10.0){
                Text(article.author ?? "Unknowned author")
                    .font(.subheadline)
                Spacer()
                HStack {
                    Image(systemName: "clock")
                    Text(article.publishedAt ?? "??:??:??")
                }
            }
            Text(article.content ?? "Content")
        }
        .padding()
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article(source: nil, author: "Author", title: "Title", description: "Description", url: nil, urlToImage: "https://media.melablog.it/6/612/iphone-fold-pieghevole.jpeg", publishedAt: "11-11-11", content: "Ben Geskin, un noto designer, non ne può più di aspettare. E così, si è armato di tavoletta grafica e Photoshop per ricreare il dispositivo della sua immaginazione: un iPhone pieghevole che si trasforma in iPad mini.\r\niPhone 12, il concept dà spettacolo"))
    }
}
