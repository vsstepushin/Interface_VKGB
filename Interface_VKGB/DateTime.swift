//
//  DateTime.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 06.03.2021.
//

import UIKit

func getDateTime() -> String {
    let date: Date = Date() - TimeInterval(Int.random(in: 0...10000000))
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ru_Ru")
    //dateFormatter.dateFormat = "d MMMM yyyy d HH:mm"
    dateFormatter.dateFormat = "d MMM yy HH:mm"
    let postDate = String(dateFormatter.string(from: date))
    return postDate
}
