//
//  ContentView.swift
//  MyOkashi
//
//  Created by YUKI on 2021/09/29.
//

import SwiftUI

struct ContentView: View {
    // OkashiDataw参照する状態関数
    // ObservedObject: 複数データを外部ファイルと共有する場合に利用する
    @ObservedObject var okashiDataList = OkashiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    
    var body: some View {
        // 垂直にレイアウト(横方向にレイアウト)
        VStack {
            // 文字を受け取るTextFieldを表示する
            TextField("キーワードを入力してください",
                    text: $inputText,
                    onCommit: {
                        // 入力完了直後に検索する
                        okashiDataList.searchOkashi(keyword: inputText)
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
