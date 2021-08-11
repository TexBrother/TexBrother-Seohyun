//
//  TestCellNode.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/11.
//

import AsyncDisplayKit

class TestCellNode: ASCellNode {
    
    // MARK: - UI
    private let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = UIImage(named: "image")
        node.borderColor = UIColor.gray.cgColor
        node.borderWidth = 1.0
        node.contentMode = .scaleAspectFit
        return node
    }()
    
    private let titleNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 2
        return node
    }()
    
    // MARK: - Initializing
    init(item: String) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.selectionStyle = .none
        self.backgroundColor = .white
        self.titleNode.attributedText = NSAttributedString(
            string: item,
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 15),
                .foregroundColor: UIColor.gray
            ]
        )
    }
    
    // MARK: - Node Life Cycle
    override func layout() {
        super.layout()
        self.imageNode.cornerRadius = 15.0
    }
    
    // MARK: - Layout
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15),
            child: self.contentLayoutSpec())
    }
    
    private func contentLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                self.imageLayoutSpec().styled {
                    $0.flexBasis = ASDimension(unit: .fraction, value: 0.3)
                },
                self.titleNode.styled {
                    $0.flexBasis = ASDimension(unit: .fraction, value: 0.7)
                }
            ])
    }
    
    private func imageLayoutSpec() -> ASLayoutSpec {
        return ASRatioLayoutSpec(ratio: 1.0, child: self.imageNode)
    }
}
