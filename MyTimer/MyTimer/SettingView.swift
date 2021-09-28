//
//  SettingView.swift
//  MyTimer
//
//  Created by YUKI on 2021/09/28.
//

import SwiftUI

struct SettingView: View {
    // 永続化する秒数設定 (初期値は10)
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        // 奥から手前方向にレイアウト
        ZStack {
            // 背景色表示
            Color("backgroundSetting")
                // セーフエリアを超えて画面全体に配置します
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            // 垂直方向にレイアウト
            VStack {
                // スペースを空ける
                Spacer()
                
                // テキストを表示する
                Text("\(timerValue)秒")
                    .font(.largeTitle)
                
                // Pickerを表示
                Picker(selection: $timerValue, label: Text("選択")) {
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)
                }
                
                // スペースを空ける
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
