//
//  CardView.swift
//  ShazamCustom
//
//  Created by Runhua Huang on 2021/6/13.
//

import SwiftUI

struct CardView: View {
    let title: String
    let subtitle: String
    let image: Image
    let showBlur: Bool
    @Binding var visible: Bool
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            if showBlur {
                VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
                    .ignoresSafeArea()
                    .onTapGesture {
                        visible = false
                    }
            }
            VStack {
                image
                    .padding([.leading, .trailing], 90)
                    .padding(.bottom, 30)
                    .padding(.top, 45)
                Text(title)
                    .foregroundColor(.customTitleColor)
                    .font(.system(size: 60, weight: .black, design: .rounded))
                    .padding(.bottom, 15)
                    .padding([.leading, .trailing], 90)
                Text(subtitle)
                    .foregroundColor(.customSubtitleColor)
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .padding([.leading, .trailing], 90)
                    .padding(.bottom, 95)
            }
                .background(Color.white)
                .cornerRadius(24)
                .scaleEffect(isAnimating ? 1 : 0.5)
                .animation(.spring(), value: isAnimating)
        }.onAppear { isAnimating.toggle() }
        .onDisappear { visible = false }
    }
}

extension CardView {
    init(title: String, subtitle: String, image: Image, visible: Binding<Bool> = .constant(false)) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.showBlur = true
        _visible = visible
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "月と星空",
                 subtitle: "カノエラナ",
                 image: .aprilImage).previewInterfaceOrientation(.landscapeRight)
    }
}

