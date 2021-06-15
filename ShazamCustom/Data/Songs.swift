//
//  Songs.swift
//  ShazamCustom
//
//  Created by Runhua Huang on 2021/6/13.
//

import Foundation
import UIKit
import SwiftUI


struct Song: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    let singer: String
    let number: Int
    let image: Image
    
    var songIndex: String {
        return "Video \(number)"
    }

    static let allSongs = [
        Song(title: "起风了", subtitle: "眨眼的瞬间，回忆吹了进来", singer: "动漫唯美风",number: 1, image: .gotWindyAniImage),
        Song(title: "若能绽放光芒", subtitle: "你驻足于春色中，于那独一无二的春色之中", singer: "石川绫子",number: 2, image: .aprilImage),
        Song(title: "学校不允许乱壁咚^.^", subtitle: "单身狗保护协会", singer: "橘卫门",number: 3, image: .schoolImage),
        Song(title: "Flower Dance", subtitle: "玫瑰到了花期", singer: "up初相识",number: 4, image: .flowerDanceImage),
        Song(title: "Windy Hill", subtitle: "愿你我，终有一天，在风丘下相遇", singer: "羽肿",number: 5, image: .windyHillImage),
        Song(title: "风居住的街道", subtitle: "那一夜我睡在自己的青春里", singer: "Yukiko", number: 6, image: .windStreetImage)
    ]
}
