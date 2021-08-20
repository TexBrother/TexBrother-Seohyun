//
//  AppleMusicViewController.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/18.
//

import AsyncDisplayKit
import UIKit

final class AppleMusicViewController: ASDKViewController<ASCollectionNode> {
    
    // MARK: Properties
    var images: [String] = [
        "musicAlbum1",
        "musicAlbum2",
        "musicAlbum3",
        "musicAlbum4",
    ]
    
    var songTitle: [String] = [
        "가습기",
        "Thick and Thin",
        "시공간",
        "NISEKOI"
    ]
    
    var singer: [String] = [
        "한요한",
        "LANY",
        "기리보이",
        "Futuristic Swaver"
    ]
    
    // MARK: Initializing
    
    override init() {
        let flowlayout = UICollectionViewFlowLayout()
        super.init(node: ASCollectionNode(collectionViewLayout: flowlayout))
        self.node.backgroundColor = .white
        self.node.dataSource = self
        self.node.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ASCollectionDataSource

extension AppleMusicViewController: ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let image = self.images[indexPath.row]
        let title = self.songTitle[indexPath.row]
        let singer = self.singer[indexPath.row]
        return {
            return MusicCellNode(image: image, title: title, singer: singer)
        }
    }
    
}
extension AppleMusicViewController: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        var itemWidth: CGFloat = UIScreen.main.bounds.width
        itemWidth -= 15*3
        itemWidth *= 0.5
        
        return ASSizeRange(min: .zero,
                           max: .init(width: itemWidth, height: .infinity))
    }
}
extension AppleMusicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
}
