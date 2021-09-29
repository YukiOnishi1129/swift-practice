//
//  PHPickerView.swift
//  MyCamera
//
//  Created by YUKI on 2021/09/29.
//

import SwiftUI
import PhotosUI

struct PHPickerView: UIViewControllerRepresentable {
    
    // sheetが表示されているか
    @Binding var isShowSheet: Bool
    // フォトライブラリーから読み込む写真
    @Binding var captureImage: UIImage?
    
    // Coordinatoeでコントローラのdelegateを管理
    class Coordinator: NSObject,
                       PHPickerViewControllerDelegate{
        // PHPickerView型の変数を用意
        var parent: PHPickerView
        // イニシャライザ
        init(parent: PHPickerView) {
            self.parent = parent
        }
        
        // フォトライブラリーで写真を選択・キャンセルしたときに実行される
        // delegateメソッド、必ず必要
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            // 写真は1つだけ選べる設定なので、最初の1件を指定
            if let result = results.first {
                // UIImage型の写真のみ非同期で取得
                result.itemProvider.loadObject(ofClass: UIImage.self) {
                    // データを取得できたら、inキーワード以降の処理を実行する
                    // (jsでいうPromiseみたいなもの)
                    (image, error) in
                    // 写真が取得できたら
                    // as?: オプショナル, 型変換を試みて、失敗した場合はnilが返される
                    if let unwrapImage = image as? UIImage {
                        // 選択された写真を追加する
                        self.parent.captureImage = unwrapImage
                    } else {
                        print("使用できる写真がないです。")
                    }
                }
            } else {
                print("選択された写真はないです。")
            }
            // sheetを閉じる
            parent.isShowSheet = false
        }
    }
    
    // Coordinatorを生成、SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        // Coordinatorクラスのインスタンスを生成
        Coordinator(parent: self)
    }
    
    // Viewを生成するときに実行
    func makeUIViewController(context: UIViewControllerRepresentableContext<PHPickerView>) ->  PHPickerViewController {
        // PHPickerViewControllerのカスタマイズ
        var configuration = PHPickerConfiguration()
        // 静止画を選択
        configuration.filter = .images
        // フォトライブラリーで選択できる枚数を1枚にする
        configuration.selectionLimit = 1
        // PHPickerViewControllerのインスタンスを生成
        let picker = PHPickerViewController(configuration: configuration)
        // delegate設定
        picker.delegate = context.coordinator
        // PHPickerViewControllerを返す
        return picker
    }
    
    // Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PHPickerView>) {
        // 処理なし
    }
}


