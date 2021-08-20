//
//  AppStoreTodayViewController.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/18.
//

import AsyncDisplayKit
import UIKit

final class AppStoreTodayViewController: ASDKViewController<ASDisplayNode> {
    
    // MARK: - Initializing
    
    override init() {
        super.init(node: ASDisplayNode())
        self.node.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
