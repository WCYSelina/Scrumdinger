//
//  History.swift
//  Scrumdinger
//
//  Created by Ching Yee Selina Wong on 9/12/2022.
//

import Foundation
struct History:Identifiable,Codable{
    let id:UUID
    let date:Date
    var attemdees:[DailyScrum.Attendee]
    var lengthInMinutes:Int
    
    init(id:UUID = UUID(),date:Date = Date(),attendees:[DailyScrum.Attendee],lengthInMinutes:Int = 5){
        self.id = id
        self.date = date
        self.attemdees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}
