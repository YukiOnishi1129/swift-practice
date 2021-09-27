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
     // 表示するViewを作成するときに実行
    func makeUIView(context: Context) -> MKMapView {
        // MKMapViewインスタンス生成
        // returnを省略している
        MKMapView()
    }
    
    // 表示したViewが更新されるたびに実行
    // uiView: makeUIViewで作成したViewオブジェクト
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
