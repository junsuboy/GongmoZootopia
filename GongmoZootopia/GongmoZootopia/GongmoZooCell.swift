//
//  GongmoZooCell.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/04/14.
//

import UIKit

class GongmoZooCell: UITableViewCell {
    @IBOutlet weak var marketLabel: UILabel!
    @IBOutlet weak var stockTypeLabel: UILabel!
    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var gongmoDateLabel: UILabel!
    @IBOutlet weak var ddayLabel: UILabel!
    @IBOutlet weak var zuganLabel: UILabel!
    @IBOutlet weak var zugan2Label: UILabel!
    @IBOutlet weak var zugan3Label: UILabel!
    @IBOutlet weak var zugan4Label: UILabel!
    @IBOutlet weak var zugan5Label: UILabel!
    @IBOutlet weak var zugan6Label: UILabel!
    @IBOutlet weak var zugan7Label: UILabel!
    @IBOutlet weak var zugan8Label: UILabel!
    @IBOutlet weak var zugan9Label: UILabel!
    @IBOutlet weak var zugan10Label: UILabel!
    @IBOutlet weak var ipoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with gongmoZoo: GongmoZoo) {
        if let stockExchange = gongmoZoo.stockExchange {
            marketLabel?.textColor = .white
            marketLabel?.backgroundColor = .blue
            marketLabel?.text = stockExchange
        } else {
            marketLabel?.textColor = .black
            marketLabel?.backgroundColor = .orange
            marketLabel?.text = "확인 필요"
        }
        
        marketLabel?.clipsToBounds = true
        marketLabel?.layer.masksToBounds = true
        marketLabel?.layer.cornerRadius = 5
        
        if let stockKind = gongmoZoo.stockKinds {
            stockTypeLabel?.textColor = .white
            stockTypeLabel?.backgroundColor = .red
            stockTypeLabel?.text = stockKind
        } else {
            stockTypeLabel?.textColor = .clear
            stockTypeLabel?.backgroundColor = .clear
            stockTypeLabel?.text = ""
        }
        stockTypeLabel?.clipsToBounds = true
        stockTypeLabel?.layer.masksToBounds = true
        stockTypeLabel?.layer.cornerRadius = 5
        gongmoDateLabel?.text = gongmoZoo.ipoDebutDate
        stockNameLabel?.text = gongmoZoo.stockName
        ddayLabel?.backgroundColor = .gray
        ddayLabel?.textColor = .white
        ddayLabel?.clipsToBounds = true
        ddayLabel?.layer.masksToBounds = true
        ddayLabel?.layer.cornerRadius = 3
        
        
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone(name: "ko_KR") as TimeZone?
        
        if(dateFormatter.date(from: gongmoZoo.ipoEndDate ?? "2022-01-01")! >= now) {
            ipoLabel?.text = "청약예정일"
        } else {
            ipoLabel?.text = "상장완료"
            gongmoDateLabel?.text = ""
            ddayLabel?.text = ""
            ddayLabel?.backgroundColor = .clear
        }
        
        
        var zuganArray = [String]()
        zuganArray = gongmoZoo.underwriter?.components(separatedBy: ",") ?? [String]()
//        zuganLabel?.text = gongmoZoo.underwriter
//
//        zuganLabel?.text = zuganSummary(zuganCompany: gongmoZoo.underwriter ?? "")
//        zugan2Label?.text = gongmoZoo.underwriter
//        zugan3Label?.text = gongmoZoo.underwriter
//        zugan4Label?.text = gongmoZoo.underwriter
//        zugan5Label?.text = gongmoZoo.underwriter
//        zugan6Label?.text = gongmoZoo.underwriter
//        zugan7Label?.text = gongmoZoo.underwriter
//        zugan8Label?.text = gongmoZoo.underwriter
//        zugan9Label?.text = gongmoZoo.underwriter
//        zugan10Label?.text = gongmoZoo.underwriter
//        zugan2Label?.text = "\(zuganArray.count)"
//
//        if((zuganArray[safe: 1]) != nil) {
//            print("옼")
//            if(zuganArray[0] != "") {
//                zuganLabel?.text = zuganArray[0]
//                zuganLabel?.clipsToBounds = true
//                zuganLabel?.layer.masksToBounds = true
//                zuganLabel?.layer.cornerRadius = 3
//                zuganLabel?.layer.borderWidth = 1
//            }
//        }
//        if((zuganArray[safe: 2]) != nil) {
//            if(zuganArray[1] != "") {
//                zugan2Label?.text = zuganArray[1]
//                zugan2Label?.clipsToBounds = true
//                zugan2Label?.layer.masksToBounds = true
//                zugan2Label?.layer.cornerRadius = 3
//                zugan2Label?.layer.borderWidth = 1
//            }
//        }
        
        if((zuganArray.count) != 0) {
            for i in 0...(zuganArray.count) {
                //        if zuganArray.count > 0 {
                //            zuganLabel?.text = zuganSummary(zuganCompnay: zuganArray[0])
                //            zuganLabel?.clipsToBounds = true
                //            zuganLabel?.layer.masksToBounds = true
                //            zuganLabel?.layer.cornerRadius = 3
                //            zuganLabel?.layer.borderWidth = 1
                //        }
                //        if zuganArray.count > 1 {
                //            zugan2Label?.text = zuganSummary(zuganCompnay: zuganArray[1])
                //            zugan2Label?.clipsToBounds = true
                //            zugan2Label?.layer.masksToBounds = true
                //            zugan2Label?.layer.cornerRadius = 3
                //            zugan2Label?.layer.borderWidth = 1
                //        }
                if i == 1 {
                    zuganLabel?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zuganLabel?.clipsToBounds = true
                    zuganLabel?.layer.masksToBounds = true
                    zuganLabel?.layer.cornerRadius = 3
                    zuganLabel?.layer.borderWidth = 1
                }
                if i == 2{
                    zugan2Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan2Label?.clipsToBounds = true
                    zugan2Label?.layer.masksToBounds = true
                    zugan2Label?.layer.cornerRadius = 3
                    zugan2Label?.layer.borderWidth = 1
                }
                
                
                if i == 3 {
                    zugan3Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan3Label?.clipsToBounds = true
                    zugan3Label?.layer.masksToBounds = true
                    zugan3Label?.layer.cornerRadius = 3
                    zugan3Label?.layer.borderWidth = 1
                }
                if i == 4 {
                    zugan4Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan4Label?.clipsToBounds = true
                    zugan4Label?.layer.masksToBounds = true
                    zugan4Label?.layer.cornerRadius = 3
                    zugan4Label?.layer.borderWidth = 1
                }
                if i == 5 {
                    zugan5Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan5Label?.clipsToBounds = true
                    zugan5Label?.layer.masksToBounds = true
                    zugan5Label?.layer.cornerRadius = 3
                    zugan5Label?.layer.borderWidth = 1
                }
                if i == 6 {
                    zugan6Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan6Label?.clipsToBounds = true
                    zugan6Label?.layer.masksToBounds = true
                    zugan6Label?.layer.cornerRadius = 3
                    zugan6Label?.layer.borderWidth = 1
                }
                if i == 7 {
                    zugan7Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan7Label?.clipsToBounds = true
                    zugan7Label?.layer.masksToBounds = true
                    zugan7Label?.layer.cornerRadius = 3
                    zugan7Label?.layer.borderWidth = 1
                }
                if i == 8 {
                    zugan8Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan8Label?.clipsToBounds = true
                    zugan8Label?.layer.masksToBounds = true
                    zugan8Label?.layer.cornerRadius = 3
                    zugan8Label?.layer.borderWidth = 1
                }
                if i == 9 {
                    zugan9Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan9Label?.clipsToBounds = true
                    zugan9Label?.layer.masksToBounds = true
                    zugan9Label?.layer.cornerRadius = 3
                    zugan9Label?.layer.borderWidth = 1
                }
                if i == 10 {
                    zugan10Label?.text = zuganSummary(zuganCompany: zuganArray[i-1])
                    zugan10Label?.clipsToBounds = true
                    zugan10Label?.layer.masksToBounds = true
                    zugan10Label?.layer.cornerRadius = 3
                    zugan10Label?.layer.borderWidth = 1
                }
            }
        }
    }
    
}

private func zuganSummary(zuganCompany: String) -> String {
    
    switch zuganCompany {
    case "KB증권":
        return "KB"
    case "KB금융증권":
        return "KB"
    case "IBK투자증권":
        return "IBK"
    case "신한투자증권":
        return "신한"
    case "다올투자증권":
        return "다올"
    case "미래에셋증권":
        return "미래"
    case "현대차증권":
        return "현대차"
    case "한국투자증권":
        return "한국"
    case "NH투자증권":
        return "NH"
    case "하나금융투자":
        return "하나"
    case "삼성증권":
        return "삼성"
    case "대신증권":
        return "대신"
    case "신영증권":
        return "대신"
    case "하이투자증권":
        return "하이"
    case "신한금융투자":
        return "신한"
    case "유진투자증권":
        return "유진"
    default:
        return "확인필요"
    }
}

//extension Array {
//    subscript (safe index: Int) -> Element? {
//        return indices ~= index ? self[index] : nil
//    }
//}
