//
//  SafariView.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 03/03/2022.
//  Copyright © 2022 Developer.Scorpio. All rights reserved.
//


import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
