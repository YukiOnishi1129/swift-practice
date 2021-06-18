//
//  ContentView.swift
//  MyFirstApp
//
//  Created by YUKI on 2021/06/18.
//

// import: フレームワークを読み込み
import SwiftUI

// View: 画面に配置される部品やレイアウト
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .font(.largeTitle)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
