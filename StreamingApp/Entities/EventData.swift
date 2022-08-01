//
//  Event.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
struct EventData: Decodable {
    var id: String
    var title: String
    var subtitle: String
    var date: String
    var imageUrl: String
    var videoUrl: String?
}
