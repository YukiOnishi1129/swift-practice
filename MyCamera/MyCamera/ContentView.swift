//
//  ContentView.swift
//  MyCamera
//
//  Created by YUKI on 2021/09/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 縦方向にレイアウト
        VStack {
            // スペースを追加
            Spacer()
            // 「カメラを起動する」ボタン
            Button(action: {
                // ボタンをタップした時のアクション
            }) {
                // テキストを表示
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    // 文字列をセンタリングに指定
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
