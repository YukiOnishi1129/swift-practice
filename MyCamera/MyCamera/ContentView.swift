//
//  ContentView.swift
//  MyCamera
//
//  Created by YUKI on 2021/09/28.
//

import SwiftUI

struct ContentView: View {
    // 撮影する写真を保持する状態変数
    @State var captureImage: UIImage? = nil
    // 撮影画面のsheetの表示を管理する状態変数
    @State var isShowSheet = false
    // シェア画面のsheetの表示を管理する状態関数
    @State var isShowActivity = false
    
    var body: some View {
        // 縦方向にレイアウト
        VStack {
            // スペースを追加
            Spacer()
            // 撮影した写真がある時
            if let unwrapCaptureImage = captureImage {
                // 撮影写真を表示 (画像を表示するためのViewを作成)
                Image(uiImage: unwrapCaptureImage)
                    // リサイズ
                    .resizable()
                    // アスペクト比を維持して画面内に
                    .aspectRatio(contentMode: .fit)
            }
            // スペースを追加
            Spacer()
            // 「カメラを起動する」ボタン
            Button(action: {
                // ボタンをタップした時のアクション
                if UIImagePickerController.isSourceTypeAvailable(.camera)
                {
                    print("カメラは利用できます。")
                    // カメラが使えるなら、isShowSheetをtrue
                    isShowSheet = true
                } else {
                    print("カメラは利用できません。")
                }
            }) {
                // テキストを表示
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    // 文字列をセンタリングに指定
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            // 上下左右に余白を追加
            .padding()
            // sheetを表示
            // isPresentedで指定した状態変数がtrueの時実行
            .sheet(isPresented: $isShowSheet) {
                // UIImagePickerController(写真撮影)をsheetに表示
                ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
            }
            
            // 「SNSに投稿する」ボタン
            Button(action: {
                // ボタンをタップした時のアクション
                // 撮影した写真がある時だけ
                // UIActivityController(シェア機能)を表示
                // captureImageがnilではない場合に、isShowActivityをtrueにしてSNSシェアを表示させる
                if let _ = captureImage {
                    isShowActivity = true
                }
            }) {
                Text("SNSに投稿する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            // sheetを表示
            // isPresentedで指定した状態変数がtrueの時実行
            .sheet(isPresented: $isShowActivity) {
                // UIActivityController(シェア機能)を表示、シェアする写真を渡す
                ActivityView(shareItems: [captureImage!])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
