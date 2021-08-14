//
//  LoginNodeController.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/11.
//

import AsyncDisplayKit

class LoginNodeController: ASDKViewController<LoginNode> {
    
    // MARK: - Initializing
    override init() {
        super.init(node: LoginNode())
        self.node.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
