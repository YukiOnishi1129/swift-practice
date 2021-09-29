//
//  EffectView.swift
//  MyCamera
//
//  Created by YUKI on 2021/09/29.
//

import SwiftUI

struct EffectView: View {
    
    // エフェクト編集画面(シート)の表示有無を管理する状態変数
     @Binding var isShowSheet: Bool
     // 撮影した写真
     let captureImage: UIImage
     // 表示する写真
     @State var showImage: UIImage?
     // シェア画面(UIActivityViewController)
     // 表示有無を管理する状態変数
     @State var isShowActivity = false
    
    var body: some View {
       // 縦方向にレイアウト
        VStack {
            // スペースを追加
            Spacer()
            
            if let unwrapShowImage = showImage {
                // 表示する写真がある場合は画面に表示
                Image(uiImage: unwrapShowImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            // スペースを追加
            Spacer()
            // 「エフェクト」ボタン
            Button(action: {
                // ボタンをタップした時のアクション
            }) {
                // テキストを表示
                Text("エフェクト")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            
            // スペースを追加
            Spacer()
            // 「シェア」ボタン
            Button(action: {
                //  ボタンをタップした時のアクション
            }) {
                // テキストを表示
                Text("シェア")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            
            // スペースを追加
            Spacer()
            // 「閉じる」ボタン
            Button(action: {
                //  ボタンをタップした時のアクション
            }) {
                // テキストを表示
                Text("閉じる")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
        }
        // 写真が表示されるときに実行される
        .onAppear {
            // 撮影した写真を表示する写真に設定
            showImage = captureImage
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView(
            isShowSheet: Binding.constant(true),
            captureImage: UIImage(named: "preview_use")!
        )
    }
}
