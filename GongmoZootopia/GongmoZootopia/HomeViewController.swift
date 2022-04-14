//
//  HomeViewController.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/04/14.
//
import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var gongmoZooArray: [GongmoZoo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchGongmoZoo(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(result):
                debugPrint("succes \(result)")

            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
//        let nibName = UINib(nibName: "GongmoZooCell", bundle: nil)
//        tableView.register(nibName, forCellReuseIdentifier: "GongmoZooCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gongmoZooArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GongmoZooCell", for: indexPath)
                as! GongmoZooCell
        
        cell.levelLabel.text = "수요예측"
        cell.marketLabel.text = gongmoZooArray[indexPath.row].stockExchange
        cell.stockTypeLabel.text = gongmoZooArray[indexPath.row].stockKinds
        
        return cell
    }
    
//    func fetchGongmoZoo() {
//        let url = "http://server.dbsg.co.kr:8080/api/v1/ipo"
//
//        AF.request(url, method: .get)
//            .responseData(completionHandler: { response in
//                switch response.result {
//                case let .success(data):
//                    let json = JSON(data)
//                    print("JSON: \(json)")
//
//                case let .failure(error):
//                    print(error)
//                }
//            })
//    }
    func fetchGongmoZoo(
        completionHandler: @escaping (Result<GongmoZoo, Error>) -> Void
    ) {
        let url = "http://server.dbsg.co.kr:8080/api/v1/ipo"

        AF.request(url, method: .get)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    debugPrint(data)
                    let decoder = JSONDecoder()
                    let json = JSON(data)
                    let str = json.description
                    var strData = str.data(using: .utf8)
                    self.gongmoZooArray = try! decoder.decode(Array<GongmoZoo>.self, from: strData!)
//                    print(self.gongmoZooArray)
//                    do {
//                        let decoder = JSONDecoder()
//                        let result = try decoder.decode(Array<GongmoZoo.self>, from: data)
//                        completionHandler(.success(result))
//                    } catch {
//                        completionHandler(.failure(error))
//                    }

                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
//        AF.request(url, method: .get)
//            .responseData(completionHandler: {response in
//                switch response.result {
//                case let .success(data):
//                    do {
//                        let decoder = JSONDecoder()
//                        let result = try decoder.decode(Array<GongmoZoo>.self, from: data)
//                        completionHandler(.success(result))
//                    } catch {
//                        completionHandler(.failure(error))
//                    }
//                case let .failure(error):
//                    completionHandler(.failure(error))
//                }
//            })
    }
}
