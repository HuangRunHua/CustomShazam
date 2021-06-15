//
//  FoodMathMediaItemProperties.swift
//  ShazamCustom
//
//  Created by Runhua Huang on 2021/6/14.
//
//  Abstract:
//  Extension for custom ShazamKit media item properties.

import ShazamKit

extension SHMediaItemProperty {
    static let singer = SHMediaItemProperty("singer")
    static let song = SHMediaItemProperty("song")
}

extension SHMediaItem {
    var song: Int? {
        return self[.song] as? Int
    }
}

