//
//  ActivityIndicatorView.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 03/03/2022.
//  Copyright © 2022 Developer.Scorpio. All rights reserved.
//


import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
