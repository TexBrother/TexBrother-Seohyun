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
        self.backgroundColor = .red
        self.imageNode.image = UIImage(named: image)
        self.titleNode.attributedText = NSAttributedString(
            string: title,
            attributes: [
                .font: UIFont.systemFont(ofSize: 11),
                .foregroundColor: UIColor.white
            ]
        )
        self.singerNode.attributedText = NSAttributedString(
            string: singer,
            attributes: [
                .font: UIFont.systemFont(ofSize: 10),
                .foregroundColor: UIColor.white
            ]
        )
    }
    
    // MARK: Node Life Cycle
    
    override func layout() {
        super.layout()
    }
    
    // MARK: - Layout
    
    func musicInfoLayout() -> ASLayoutSpec {

        // 제목 - 가수
        let textSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 3.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                self.titleNode,
                self.singerNode
            ]
        )
        
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                self.imageNode,
                textSpec
            ]
        )
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let musicInfoLayout = self.musicInfoLayout()
        let insets = UIEdgeInsets(top: 6, left: 6, bottom: 5, right: 6)
        return ASInsetLayoutSpec(
            insets: insets,
            child: musicInfoLayout
        )
    }
}
