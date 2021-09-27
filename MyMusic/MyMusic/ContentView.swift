//
//  ContentView.swift
//  MyMusic
//
//  Created by YUKI on 2021/09/27.
//

import SwiftUI

struct ContentView: View {
    // 音を鳴らすためのSoundPlayerクラスのインスタンス
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        ZStack {
            // 背景画像を指定する
            Image("background")
                // リサイズする
                .resizable()
                // 画像いっぱいになるようにセーフエリア外一杯になるまで指定
                .edgesIgnoringSafeArea(.all)
                // アスペクト比(縦横比)を維持して短編基準に収まるように
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            
            // 水平にレイアウト(横方向にレイアウト)
            HStack {
                //シンバルボタン
                Button(action: {
                    // ボタンをタップした時のアクション
                    soundPlayer.cymbalPlay()
                }) {
                    // 画像を表示する
                    ButtonImageView(imageName: "cymbal")
                }
                
                // ギターボタン
                Button(action: {
                    // ボタンをタップした時のアクション
                    soundPlayer.guitarPlay()
                }) {
                    // 画像を表示する
                    ButtonImageView(imageName: "guitar")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
