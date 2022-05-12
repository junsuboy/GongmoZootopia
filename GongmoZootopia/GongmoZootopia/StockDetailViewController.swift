//
//  StockDetailViewController.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/04/14.
//

import UIKit

class StockDetailViewController: UIViewController {
    var id: Int?
    
    @IBOutlet weak var ipoPriceLabel: UILabel!
    @IBOutlet weak var ipoPriceBandLabel: UILabel!
    @IBOutlet weak var ipoForecastDateLabel: UILabel!
    @IBOutlet weak var ipoEndDateLabel: UILabel!
    @IBOutlet weak var ipoRefundDateLabel: UILabel!
    @IBOutlet weak var ipoDebutDateLabel: UILabel!
    @IBOutlet weak var stockWorkTypeLabel: UILabel!
    @IBOutlet weak var stockExchangeLabel: UILabel!
    @IBOutlet weak var earnLabel: UILabel!
    @IBOutlet weak var earnPureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStockDetail(stockIndex: id!)
    }
    
    
    func configureView(ipoInformation: StockDetail) {
        if(ipoInformation.ipo.ipoPrice == 0) {
            self.ipoPriceLabel.text = "미정"
        } else {
            self.ipoPriceLabel.text = "\(ipoInformation.ipo.ipoPrice)"
        }
        self.ipoPriceBandLabel.text = "\(ipoInformation.ipo.ipoPriceLow) ~ \(ipoInformation.ipo.ipoPriceHigh)원"
        self.ipoForecastDateLabel.text = "미정"
        self.ipoEndDateLabel.text = ipoInformation.ipo.ipoStartDate
        self.ipoRefundDateLabel.text = ipoInformation.ipo.ipoRefundDate
        if(ipoInformation.ipo.ipoDebutDate != nil) {
            self.ipoDebutDateLabel.text = "미정"
        } else {
            self.ipoDebutDateLabel.text = ipoInformation.ipo.ipoDebutDate
        }
        if(ipoInformation.ipo.sector != nil) {
            self.stockWorkTypeLabel.text = ipoInformation.ipo.sector
        } else {
            self.stockWorkTypeLabel.text = "확인필요"
        }
        self.stockExchangeLabel.text = ipoInformation.ipo.stockExchange
        if(ipoInformation.ipo.sales == 0) {
            self.earnLabel.text = "확인 필요"
        } else {
            self.earnLabel.text = "\(ipoInformation.ipo.stockExchange)"
        }
        if(ipoInformation.ipo.profits == 0) {
            self.earnPureLabel.text = "확인 필요"
        } else {
            self.earnPureLabel.text = "\(ipoInformation.ipo.profits)"
        }
    }
    
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func getStockDetail(stockIndex: Int!) {
        guard let url = URL(string: "http://server.dbsg.co.kr:8080/api/v1/ipo/\(String(describing: stockIndex!))") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, response, error in
            let successRange = (200..<300)
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let stockDetail = try? decoder.decode(StockDetail.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.configureView(ipoInformation: stockDetail)
                }
            } else {
                self?.showAlert(message: "통신이 원활하지 않습니다")
            }
        }.resume()
    }
    
}
