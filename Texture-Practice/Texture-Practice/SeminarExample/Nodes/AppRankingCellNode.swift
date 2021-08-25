//
//  AppRankingCellNode.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/25.
//

import Foundation
import AsyncDisplayKit

class AppRankingCellNode: ASCellNode {
    
    // MARK: - UI
    let specNode = ASDisplayNode()
    private let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.contentMode = .scaleAspectFit
        return node
    }()
    let titleNode = ASTextNode()
    let explanationNode = ASTextNode()
    let downloadButtonNode = ASButtonNode()
    let separatorLineNode = ASDisplayNode()
    
    // MARK: - Initializing
    
    init(appModel: AppModel) {
        super.init()
        automaticallyManagesSubnodes = true
        self.backgroundColor = .black
        
        imageNode.image = UIImage(named: appModel.iconImage)
        
        titleNode.attributedText = NSAttributedString(
            string: appModel.title,
            attributes: [
                .font: UIFont.systemFont(ofSize: 13, weight: .medium),
                .foregroundColor: UIColor.white
            ]
        )
        
        explanationNode.attributedText = NSAttributedString(
            string: appModel.explanation,
            attributes: [
                .font: UIFont.systemFont(ofSize: 11, weight: .regular),
                .foregroundColor: UIColor.lightGray
            ]
        )
    
        downloadButtonNode.layer.cornerRadius = 13
        downloadButtonNode.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        downloadButtonNode.setTitle("받기",
                                    with: UIFont.systemFont(ofSize: 12, weight: .bold),
                                    with: UIColor(red: 58/255, green: 130/255, blue: 247/255, alpha: 1.0),
                                    for: .normal)
        
        separatorLineNode.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 19/255, alpha: 1.0)
    }
    
    // MARK: Node Life Cycle
    
    override func layout() {
        super.layout()
    }
    
    func appLayoutSpec() -> ASLayoutSpec {
        
        let textSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 6.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                self.titleNode,
                self.explanationNode
            ]
        )
        
        self.downloadButtonNode.styled {
            $0.height = ASDimension(unit: .points, value: 25)
            $0.width = ASDimension(unit: .points, value: 65)
        }
        
        let interTextButtonSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 23.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                textSpec,
                self.downloadButtonNode
            ]
        )
        
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 13.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                interTextButtonSpec,
                self.separatorLineNode
            ]
        )
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let appLayout = self.appLayoutSpec()
        
        let insets = UIEdgeInsets(top: 18, left: 13, bottom: 18, right: 13)
        
        self.imageNode.styled {
            $0.height = ASDimension(unit: .points, value: 80)
            $0.width = ASDimension(unit: .points, value: 80)
        }
        
        let imageAndInfoLayoutSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 20.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                self.imageNode,
                appLayout
            ]
        )
        
        return ASInsetLayoutSpec(
            insets: insets,
            child: imageAndInfoLayoutSpec
        )
    }
}
