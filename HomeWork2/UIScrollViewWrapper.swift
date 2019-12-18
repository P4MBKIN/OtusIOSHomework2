//
//  UIScrollViewWrapper.swift
//  HomeWork2
//
//  Created by Pavel Antonov on 18.12.2019.
//  Copyright © 2019 OtusCourse. All rights reserved.
//

import SwiftUI
import UIKit

struct UIScrollViewWrapper: UIViewRepresentable {
    
    @EnvironmentObject var newsListViewModel: NewsListViewModel
    
    var coordinator: Coordinator?

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.contentSize = .init(width: UIScreen.main.bounds.size.width * 3, height: 60)
        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let buttonApple = UIButton(type: .system)
        let buttonBitcoin = UIButton(type: .system)
        let buttonMicrosoft = UIButton(type: .system)
        let buttons = [buttonApple, buttonBitcoin, buttonMicrosoft]
        let buttonTitles = ["Apple", "bitcoin", "Microsoft"]

        for i in 0...2 {
            buttons[i].tag = i
            buttons[i].frame = CGRect(x: UIScreen.main.bounds.size.width * CGFloat(i), y: 0, width: UIScreen.main.bounds.size.width, height: 60)
            
            buttons[i].setTitle(buttonTitles[i], for: .normal)
            
            buttons[i].addTarget(context.coordinator, action: #selector(context.coordinator.buttonTapped(_:)), for: .touchUpInside)
            
            uiView.addSubview(buttons[i])
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
