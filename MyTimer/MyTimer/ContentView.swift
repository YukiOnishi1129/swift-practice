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
            VStack {
                Text("タイマー画面")
            }
            // ナビゲーションバーにボタンを追加
            .navigationBarItems(trailing:
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
