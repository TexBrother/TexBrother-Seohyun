//
//  TestNodeController.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/11.
//

import AsyncDisplayKit

class TestNodeController: ASDKViewController<ASTableNode> {

    // MARK: - Properties
    var items: [String] = [
        "Welcome to Texture-KR",
        "Welcome to Texture-KR",
        "Welcome to Texture-KR, long test!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    ]
    
    // MARK: - Initializing
    override init() {
        super.init(node: ASTableNode(style: .plain))
        self.node.backgroundColor = .white
        self.node.dataSource = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ASTableDataSource
extension TestNodeController: ASTableDataSource {
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let item = self.items[indexPath.row]
        return { /// 왜 리턴 안에 리턴이 드갈까
            return TestCellNode(item: item)
        }
    }
}
