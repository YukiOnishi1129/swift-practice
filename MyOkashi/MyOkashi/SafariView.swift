//
//  SafariView.swift
//  MyOkashi
//
//  Created by YUKI on 2021/09/29.
//

import SwiftUI
import SafariServices

// SFSafariViewControllerを起動する構造体
// (アプリ内部でSafariを起動させる)
struct SafariView: UIViewControllerRepresentable {
    
    // 表示するホームページのURLを受け取る
    var url: URL
    
    // 表示するViewを生成するときに実行
    func makeUIViewController(context: Context) -> SFSafariViewController {
        // Safariを起動
        return SFSafariViewController(url: url)
    }
    
    // Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // 処理なし
    }
}
