//
//  ContentView.swift
//  MyTimer
//
//  Created by YUKI on 2021/09/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // 背景画像
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                //垂直方向にレイアウト
//                View(部品)間の感覚を30にする
                VStack(spacing: 30.0) {
                    Text("残り10秒")
                        // 文字サイズを指定
                        .font(.largeTitle)
                    
                    // 水平方向にレイアウト
                    HStack {
                        // スタートボタン
                        Button(action: {
                            // ボタンをタップした時のアクション
                        }) {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                // 円形に切り抜く
                                .clipShape(Circle())
                        }
                        
                        // ストップボタン
                        Button(action: {
                            // ボタンをタップした時のアクション
                        }) {
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            // ナビゲーションバーにボタンを追加
            // navigationBarItems: 画面上部のナビゲーションバー部分のレイアウト
            .navigationBarItems(trailing: // trailing: 画面右端に寄せる
                // ナビゲーション遷移
                NavigationLink(
                    destination: SettingView()) {
                    // テキスト表示
                    Text("秒数設定")
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
