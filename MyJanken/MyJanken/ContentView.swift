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
                
                // 新しいジャンケンの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                // repeatは繰り返しを意味する
                repeat {
                    // 1,2,3の変数をランダムに算出(乱数)
                    newAnswerNumber = Int.random(in: 1...3)
                    
                    // 前回と同じ結果の時は、再度ランダムに数値を出す
                    // 異なる結果の時は、repeatをにける
                } while answerNumber == newAnswerNumber
                
                /**
                    ループ処理
                    repeact {
                    } while 繰り返す条件
                 */
                
                // 新しいジャンケンの結果を格納
                answerNumber = newAnswerNumber
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
