//
//  CalendarViewController.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/05/10.
//

import Foundation
import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    @IBOutlet weak var calendar: FSCalendar!
    var events: [Date]!
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        calendar.dataSource = self
//        calendar.scope = .month
        calendar.appearance.eventDefaultColor = UIColor.red
        
        
        setEvents()
    }
    
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    //날짜 밑에 문자열을 표시
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
            return "라이브러리변경예정"
        case "2022-05-12":
            return "출근"
        case "2022-05-13":
            return "지각"
        case "2022-05-14":
            return "결근"
        default:
            return nil
        }
    }
    
    func setEvents() {
        let dfMatter = DateFormatter()
        dfMatter.locale = Locale(identifier: "ko_KR")
        dfMatter.dateFormat = "yyyy-MM-dd"
        
        // events
        let myFirstEvent = dfMatter.date(from: "2022-05-01")
        let mySecondEvent = dfMatter.date(from: "2022-05-20")
        
        events = [myFirstEvent!, mySecondEvent!]
    }
    
    
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.events.contains(date) {
            return 1
        } else {
            return 0
        }
    }
}
