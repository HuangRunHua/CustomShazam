//
//  SongsListView.swift
//  ShazamCustom
//
//  Created by Runhua Huang on 2021/6/13.
//

import SwiftUI

struct SongsListView: View {
    let currentSong: Song?
    
    var body: some View {
        ZStack {
            BackgroundView()
            SongList()
                .frame(width: 720, height: 666)
            if let song = currentSong {
                CardView(title: song.title, subtitle: song.subtitle, image: song.image)
            }
        }.shadow(color: Color.black.opacity(0.2), radius: 16, x: 0, y: 10)
    }
}

private struct SongList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("Videos")
                .foregroundColor(.customTitleColor)
                .font(.system(size: 60, weight: .black, design: .rounded))
            ScrollView {
                ForEach(Song.allSongs, id: \.id) { song in
                    SongCell(song: song)
                }
            }
        }
        .padding([.leading, .trailing], 80)
        .padding(.top, 64)
        .background(Color.white)
        .cornerRadius(24)
    }
}

private struct SongCell: View {
    let song: Song
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("VIDEO \(song.number)")
                .foregroundColor(.customSubtitleColor)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .opacity(0.6)
                .padding(.top, 13)
                .padding(.leading, 5)
            Text(song.title)
                .foregroundColor(.customSubtitleColor)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .padding(.bottom, 6)
                .padding(.leading, 5)
            Divider()
        }
    }
}

private struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient.backgroundGradient(startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Image.bigAppleImage
                .position(x: 170, y: 150)
            Image.bigAppleImage
                .position(x: 987, y: 600)
            Image.smallGreenAppleImage
                .position(x: 220, y: 756)
            Image.smallGreenAppleImage
                .position(x: 1150, y: 127)
        }
    }
}

struct SongsListView_Previews: PreviewProvider {
    static var previews: some View {
//        SongsListView(currentSong: Song(title: "起风了", singer: "@你爱了夏天", number: 1))
//        SongsListView(currentSong: Song(title: "起风了", subtitle:"HHHHHHH", singer: "买辣椒也用券",number: 1, image: .gotWindyAniImage))
        SongsListView(currentSong: nil)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
