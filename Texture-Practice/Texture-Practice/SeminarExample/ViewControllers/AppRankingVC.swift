//
//  AppRankingVC.swift
//  Texture-Practice
//
//  Created by 장서현 on 2021/08/25.
//

import AsyncDisplayKit

class AppRankingVC: ASDKViewController<ASTableNode> {
    
    // MARK: - Properties
    
    var appList: [AppModel] = []
    
    // MARK: - Initializing
    
    override init() {
        super.init(node: ASTableNode())
        setAppList()
        self.node.view.allowsSelection = false
        self.node.view.separatorStyle = .none
        self.node.view.backgroundColor = .black
        self.node.dataSource = self
        self.node.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAppList() {
        appList.append(contentsOf: [
            AppModel(iconImage: "soptAppIcon1", title: "OUNCE - 집사를 위한 똑똑한 기록장", explanation: "우리 고양이의 까다로운 입맛 정리 서비스"),
            AppModel(iconImage: "soptAppIcon2", title: "포켓유니브", explanation: "MZ세대를 위한, 올인원 대학생활 관리 플랫폼"),
            AppModel(iconImage: "soptAppIcon3", title: "MOMO", explanation: "책 속의 문장과 함께 쓰는 일기"),
            AppModel(iconImage: "soptAppIcon4", title: "Weathy(웨디)", explanation: "나에게 돌아오는 맞춤 날씨 서비스"),
            AppModel(iconImage: "soptAppIcon5", title: "BEME", explanation: "나를 알아가는 질문 다이어리"),
            AppModel(iconImage: "soptAppIcon6", title: "플레이스픽", explanation: "우리들끼리 공유하는 최애장소, 플레이스픽"),
            AppModel(iconImage: "soptAppIcon7", title: "몽글", explanation: "우리가 만드는 문장 큐레이션 플랫폼, 몽글"),
        ])
    }
}

// MARK: - ASTableDatasource, ASTableDelegate

extension AppRankingVC: ASTableDataSource {
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        // 블럭으로 return 하는게 더 안전
        return AppRankingCellNode(appModel: appList[indexPath.row])
    }
}

extension AppRankingVC: ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRange(min: CGSize(width: 375, height: 106),
                           max: CGSize(width: 375, height: 106))
    }
}

