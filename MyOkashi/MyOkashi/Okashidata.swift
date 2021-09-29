//
//  Okashidata.swift
//  MyOkashi
//
//  Created by YUKI on 2021/09/29.
//

import Foundation

// お菓子データ検索用クラス
// ObservableObject: データ状態を管理するために使用
class OkashiData: ObservableObject {
    // JSONのデータ構造
    // Codable: JSONのデータ項目名とプログラムの変数めいを同じ名前にすると、JSONを変換したときに、一括してデータを格納することができる
    struct ResultJson: Codable {
        // JSONのitem内のデータ構造
        struct Item: Codable {
            // お菓子の名称
            let name: String?
            // 掲載URL
            let url: URL?
            // 画像URL
            let image: URL?
        }
        // 複数要素
        let item: [Item]?
    }
    // Web API検索用メソッド 第一引数: keyword 検索したいワード
    func searchOkashi(keyword: String) {
        // デバッグエリアに出力
        print(keyword)
        
        // お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        // リクエストURLの組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
        
        // リクエストに必要な情報を生成
        let req = URLRequest(url: req_url)
        // データ転送を管理するためのセッションを生成
        // URLSession: リクエストURLからデータをダウンロードしたり、リクエストURLにデータをアップロードすることができる
        // セッション: サーバとの通信の開始から終了まで
        // OperationQueue: 非同期処理を実施できる
        let session = URLSession(configuration: .default,
                                 delegate: nil,
                                 delegateQueue: OperationQueue.main)
        // リクエストをタスクとして登録
        // dataTask: リクエスト処理を実行しなけらばならない処理として登録
        let task = session.dataTask(with: req, completionHandler: {
            // data: 取得後のデータが格納されている
            // response: 通信状態を示す情報
            // error: 失敗した時のエラー内容
            (data, response, error) in
            // セッションを終了
            session.finishTasksAndInvalidate()
            // do try catchエラーハンドリング
            do {
                // JSONDecoderのインスタンス取得
                let decoder = JSONDecoder()
                // 受け取ったJSONデータをパース(解析)して格納
                // 構造体「ResultJson」の形にパースする
                let json = try decoder.decode(ResultJson.self, from: data!)
                print(json)
            } catch {
                // エラー処理
                print("エラーが出ました")
            }
        })
        // ダウンロード開始 (.dataTaskで登録されたリクエストのタスクが実行され、JSONのダウンロードが始まる)
        task.resume()
    }
}
