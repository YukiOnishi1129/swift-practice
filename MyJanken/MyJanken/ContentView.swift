//
//  ContentView.swift
//  MyJanken
//
//  Created by YUKI on 2021/09/27.
//

import SwiftUI

struct ContentView: View {
    // 変数定義
    // @Stateをつけることで、更新可能な変数を定義できる
    // @Stateを付けずに変数定義すると、定数になる
    @State var answerNumber: Int = 0
    
    var body: some View {
        
        VStack {
            
            if answerNumber == 0 {
                Text("これからじゃんけんをします")
            } else if answerNumber == 1 {
                // グー画像を指定
                Image("gu")
                    // リサイズを指定
                    .resizable()
                    // 画面内に収まるように、アスペクト比(縦横比)を維持する指定
                    .aspectRatio(contentMode: .fit)
                // ジャンケンの種類を指定
                Text("グー")
                
            } else if answerNumber == 2 {
                // チョキ画像を指定
                Image("choki")
                    // リサイズを指定
                    .resizable()
                    // 画面内に収まるように、アスペクト比(縦横比)を維持する指定
                    .aspectRatio(contentMode: .fit)
                // ジャンケンの種類を指定
                Text("チョキ")
                
            } else {
                // パー画像を指定
                Image("pa")
                    // リサイズを指定
                    .resizable()
                    // 画面内に収まるように、アスペクト比(縦横比)を維持する指定
                    .aspectRatio(contentMode: .fit)
                // ジャンケンの種類を指定
                Text("パー")
                
            }
            
            // 「じゃんけんをする」ボタン
            Button(action: {
                // 次のジャンケンへ
                answerNumber = answerNumber + 1
            }) {
                // Buttonに表示させる文字の指定
                Text("じゃんけんする！")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
