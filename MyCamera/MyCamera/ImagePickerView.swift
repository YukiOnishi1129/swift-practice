//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by YUKI on 2021/09/28.
//

import SwiftUI

// UIViewControllerRepresentable: SwiftUIでUIViewControllerを使うために使用
struct ImagePickerView: UIViewControllerRepresentable {
    
    // @Binding: @Stateを定義したViewと他のViewとの間で双方向にデータ連動できるようにする構造体
    // UIImagePickerController(写真撮影)が表示されているか
    @Binding var isShowSheet: Bool
    // 撮影した写真
    @Binding var captureImage: UIImage?
    
    // Coordinatorでコントローラのdelegateを管理
    class Coordinator: NSObject,
       UINavigationControllerDelegate,
       UIImagePickerControllerDelegate {
        // ImagePickerView型の変数を用意
        let parent: ImagePickerView
        // イニシャライザ
        init(_ parent: ImagePickerView) {
            // self.parent: ImagePickerViewで定義したparent
            self.parent = parent
        }
        
        // 撮影が終わったときに呼ばれるdelegateメソッド、必ず必要
        // 第一引数：picker: UIImagePickerController: カメラ撮影を行う画面を格納 「_」はラベル名の省略
        // 第２引数: info:[UIImagePickerController.InfoKey: Any]: 撮影した写真の情報を格納 didFinishPickingMediaWithInfoはラベル
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info:
                [UIImagePickerController.InfoKey: Any] // 色んな型を格納するためAny
        ){
            
            //撮影した写真をcaptureImageに保存
            // as? UIImage: Any型をUIImage型に変換
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            // sheetを閉じない
            parent.isShowSheet = true
        }
        // キャンセルボタンを選択されたとき呼ばれる
        // delegateメソッド、必ず必要
        func imagePickerControllerDidCancel(
            _ picker: UIImagePickerController
        ){
            // sheetを閉じる　 (撮影画面を閉じる)
            parent.isShowSheet = false
        }
    }
    
    // Coordinatorを生成、SwiftUIによって自動的に呼び出し
    // 先述したCoordinatorクラスのインスタンスを作って使えるようにする
    // makeCoordinator: Coordinatorクラスのメソッド、SwiftUIが自動で呼び出して実行する
    func makeCoordinator() -> Coordinator {
        // Coodinatorクラスのインスタンスを生成
        Coordinator(self)
    }
    // Viewを生成するときに実行 (SwiftUIが自動で実行)
    // カメラの起動に必要なUIImagePickerControllerのインスタンスを作成する
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        // UIImagePickerControllerのインスタンスを生成
        let myImagePickerController = UIImagePickerController()
        // sourceTypeにcameraを設定 (cameraから写真を取得できるようになる)
        myImagePickerController.sourceType = .camera
        // delegate設定
        myImagePickerController.delegate = context.coordinator
        // UIImagePickerControllerを返す (カメラ撮影ができるようになる)
        return myImagePickerController
    }
    // Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        // 処理なし
    }
}

