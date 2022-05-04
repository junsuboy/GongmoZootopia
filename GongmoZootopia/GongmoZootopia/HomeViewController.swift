//
//  HomeViewController.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/04/14.
//
import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var gongmoZooList = [GongmoZoo]()
    var dataTasks = [URLSessionTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let nibName = UINib(nibName: "GongmoZooCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "GongmoZooCell")
        
        tableView.rowHeight = 170
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        fetchGongmoZoo()
    }
    
}

// Data Fetching
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gongmoZooList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GongmoZooCell", for: indexPath) as! GongmoZooCell
        
        let gongmoZoo = gongmoZooList[indexPath.row]
        cell.configure(with: gongmoZoo)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGongmoZoo = gongmoZooList[indexPath.row].ipoIndex
        let detailViewController = StockDetailViewController()
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "StockDetailViewController") as? StockDetailViewController else {return}
        
//        detailViewController.id = selectedGongmoZoo
//        self.show(detailViewController, sender: self)
        
    
        nextVC.id = selectedGongmoZoo
        self.present(nextVC, animated: true)
    }
    
    func fetchGongmoZoo() {
        guard let url = URL(string: "http://server.dbsg.co.kr:8080/api/v1/ipo") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            guard error == nil,
                  let self = self,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let gongmoZoos = try? JSONDecoder().decode([GongmoZoo].self, from: data) else {
                print("ERROR: URLSession data task \(error?.localizedDescription ?? "")")
                return
            }
            
            switch response.statusCode {
            case (200...299): // 성공
                self.gongmoZooList += gongmoZoos
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case (400...499): // 클라이언트 에러
                print("""
                    ERROR: Client ERROR \(response.statusCode)
                    Response: \(response)
                """)
            case (500...599): // 서버 에러
                print("""
                    ERROR: Server ERROR \(response.statusCode)
                    Response: \(response)
                """)
            default:
                print("""
                    ERROR: \(response.statusCode)
                    Response: \(response)
                """)
                
            }
        }
        dataTask.resume()
    }
}

