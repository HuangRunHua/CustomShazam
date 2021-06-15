//
//  ShazamCustomApp.swift
//  ShazamCustom
//
//  Created by Runhua Huang on 2021/6/13.
//

import SwiftUI

@main
struct ShazamCustomApp: App {
    @StateObject private var matcher = Matcher()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(matcher)
        }
    }
}
