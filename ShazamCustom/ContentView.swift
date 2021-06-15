//
//  ContentView.swift
//  ShazamCustom
//
//  Created by Runhua Huang on 2021/6/13.
//
//  Abstract:
//  The main UI that changes views depending on the state of the match.
//

import SwiftUI
import Combine
import ShazamKit

struct ContentView: View {
    @EnvironmentObject var matcher: Matcher
    
    var body: some View {
        ZStack {
            SongsListView(currentSong: nil)
            if let mediaItem = matcher.result.mediaItem{
                SongsListView(currentSong: Song.allSongs.first { song in
                    print("mediaItem = \(mediaItem)")
                    print("song.title = \(song.title)")
                    return song.number == mediaItem.song
                })
            }
        }.onAppear {
            do {

                if let catalog = try CatalogProvider.catalog() {
                    try matcher.match(catalog: catalog)
                }
            } catch {
                print("Record Error")
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Matcher())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
