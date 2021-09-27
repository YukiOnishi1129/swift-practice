//
//  ContentView.swift
//  MyJanken
//
//  Created by YUKI on 2021/09/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        グー画像を指定
        Image("gu")
//            リサイズを指定
            .resizable()
//             画面内に収まるように、アスペクト比(縦横比)を維持する指定
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
