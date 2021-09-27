//
//  MapView.swift
//  MyMap
//
//  Created by YUKI on 2021/09/27.
//

import SwiftUI
import MapKit

// MapKitのViewを使用する場合は、UIViewRepresentableプロトコルを指定する
// makeUIView,updateUIViewの2つのメソッドが必要になる
struct MapView: UIViewRepresentable {
    // 検索キーワード
    let searchKey: String
    
     // 表示するViewを作成するときに実行
    // 初回描画時のみ実行される
    func makeUIView(context: Context) -> MKMapView {
        // MKMapViewインスタンス生成
        // returnを省略している
        MKMapView()
    }
    
    // 表示したViewが更新されるたびに実行
    // uiView: makeUIViewで作成したViewオブジェクト
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // 入力された文字をデバックエリアに表示
        print(searchKey)
        // CLGeocoderインスタンスを取得
        //　経度緯度から住所を検索できる
        let geocoder = CLGeocoder()
        
        // 入力された文字から位置情報を取得
        //　geocodeAddressString: 住所やランドマークの文字列から位置情報を取得
        // 第１引数: 検索したい場所を記述した文字列
        // 第２引数: 結果と一緒に実行するまとまった処理(クロージャ) リクエストの失敗の有無に限らず実行される
        geocoder.geocodeAddressString(
            searchKey,
            completionHandler: {(placemarks, error) in // in の後に処理を記述
                // リクエストの結果が存在し、1件目の情報から位置情報を取り出す
                // if let: 全ての格納が無事完了したらtrue
                if let unwrapPlacemarks = placemarks , // placemarks:
                   //  取得に成功した位置情報
                   let firstPlacemarks = unwrapPlacemarks.first , // 配列から取り出す 配列.first: 配列の1つ目の要素を取り出す
                   // 経度緯度、高度などは格納される「location」を取り出す
                   let location = firstPlacemarks.location {
                    
                    // 位置情報から経度緯度をtargetCoordinateに取り出す
                    let targetCoordinate = location.coordinate
                    // 経度緯度をデバックエリアに表示
                    print(targetCoordinate)
                    
                    // MKPointAnnotationインスタンスを取得し、ピンを生成
                    let pin = MKPointAnnotation()
                    // ピンを置く場所に経度緯度を設定
                    pin.coordinate = targetCoordinate
                    // ピンのタイトルを設定
                    pin.title = searchKey
                    // ピンを地図に置く
                    uiView.addAnnotation(pin)
                    // 経度緯度を中心にして半径500mの範囲を表示
                    uiView.region = MKCoordinateRegion(
                        center: targetCoordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0
                    )
                }
            }
        )
    }
}

// プレビューモードで読み込まれる
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
