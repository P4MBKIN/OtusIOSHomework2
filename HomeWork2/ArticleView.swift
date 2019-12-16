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
        Text(article.author ?? "Unknowned author")
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article(source: nil, author: "Author", title: "Title", description: "Description", url: nil, urlToImage: "https://media.melablog.it/6/612/iphone-fold-pieghevole.jpeg", publishedAt: "11-11-11", content: "Ben Geskin, un noto designer, non ne può più di aspettare. E così, si è armato di tavoletta grafica e Photoshop per ricreare il dispositivo della sua immaginazione: un iPhone pieghevole che si trasforma in iPad mini.\r\niPhone 12, il concept dà spettacolo"))
    }
}
