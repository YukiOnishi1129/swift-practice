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
    @State var outputText = "Hello, World!"
    
    var body: some View {
        // VStack: ひとつの画面にひとまとめにする
        VStack {
            Text(outputText)
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                outputText = "Hi, Swift!"
                
                print("デバッグテスト")
                print(outputText)
            }) {
                Text("切り替えボタン")
                    .foregroundColor(Color.white)
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

//ContentView_Previews : UIデザインのプレビューをするために使用
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView().previewDevice("iPhone 8")
//        ContentView().previewDevice("iPad Pro (9.7-inch)")
        ContentView()
    }
}
