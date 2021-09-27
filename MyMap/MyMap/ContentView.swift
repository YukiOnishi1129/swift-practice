//
//  ContentView.swift
//  MyMap
//
//  Created by YUKI on 2021/09/27.
//

import SwiftUI

struct ContentView: View {
    //入力中の文字列を保持する状態変数
     @State var inputText:String = ""
     // 検索キーワードを保持する状態変数
     @State var dispSearchKey:String = ""
    
    
    var body: some View {
        // 垂直方向にレイアウト
        VStack {
            // テキストフィールド
            TextField("キーワードを入力してください",
                      text: $inputText, onCommit: {
                // 入力が完了したので、検索キーワードに設定する
                dispSearchKey = inputText
                // 検索キーワードをデバッグエリアに出力する
                print("入力したキーワード：" + dispSearchKey)
            })
                // 余白を追加
                .padding()
            
            // マップを表示
            MapView(searchKey: dispSearchKey)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
