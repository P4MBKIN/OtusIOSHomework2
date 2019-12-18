//
//  Coordinator.swift
//  HomeWork2
//
//  Created by Pavel Antonov on 18.12.2019.
//  Copyright © 2019 OtusCourse. All rights reserved.
//

import UIKit

class Coordinator: NSObject {
    var parent: UIScrollViewWrapper

    init(_ wrapper: UIScrollViewWrapper) {
        self.parent = wrapper
    }
    
    @objc func buttonTapped(_ button: UIButton) {
        parent.newsListViewModel.topic = button.titleLabel?.text ?? ""
        parent.newsListViewModel.refresh()
        parent.newsListViewModel.pageLoad()
        
    }
}
