//
//  MusicCellNode.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/18.
//

import AsyncDisplayKit

final class MusicCellNode: ASCellNode {
    
    // MARK: UI
    
    private let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.contentMode = .scaleAspectFit
        return node
    }()
    
    private let titleNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    private let singerNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    // MARK: Initializing
    
    init(image: String, title: String, singer: String) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.selectionStyle = .none
        self.backgroundColor = .white
        self.imageNode.image = UIImage(named: image)
        self.titleNode.attributedText = NSAttributedString(
            string: title,
            attributes: [
                .font: UIFont.systemFont(ofSize: 11),
                .foregroundColor: UIColor.black
            ]
        )
        self.singerNode.attributedText = NSAttributedString(
            string: singer,
            attributes: [
                .font: UIFont.systemFont(ofSize: 10),
                .foregroundColor: UIColor.black
            ]
        )
    }
    
    // MARK: Node Life Cycle
    
    override func layout() {
        super.layout()
    }
    
    // MARK: - Layout
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 34, left: 15, bottom: 34, right: 15),
            child: self.contentLayoutSpec()
        )
    }
    
    private func contentLayoutSpec() -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                self.imageLayoutSpec().styled {
                    $0.flexBasis = ASDimension(unit: .fraction, value: 0.8)
                },
                self.titleNode.styled {
                    $0.flexBasis = ASDimension(unit: .fraction, value: 0.1)
                },
                self.singerNode.styled {
                    $0.flexBasis = ASDimension(unit: .fraction, value: 0.1)
                }
            ]
        )
    }
    
    private func imageLayoutSpec() -> ASLayoutSpec {
        return ASRatioLayoutSpec(ratio: 1.0, child: self.imageNode)
    }
}
