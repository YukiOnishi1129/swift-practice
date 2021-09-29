//
//  ActivityView.swift
//  MyCamera
//
//  Created by YUKI on 2021/09/29.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    // UIViewController(シェア機能)でシェアする写真
    let shareItems: [Any]
    
    // 表示するViewを生成するときに実行 (SwiftUIで自動的に実行される)
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        // UIActivityViewControllerでシェアする機能を生成
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        // UIActivityViewControllerを返す
        return controller
    }
    
    // Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
        // 処理なし
    }
}

