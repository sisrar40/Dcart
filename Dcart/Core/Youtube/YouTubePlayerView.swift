//
//  YouTubePlayerView.swift
//  Dcart
//
//  Created by sisrar on 15/03/24.
//

import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        loadYouTubeVideo(webView: webView)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        loadYouTubeVideo(webView: webView)
    }

    private func loadYouTubeVideo(webView: WKWebView) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        let request = URLRequest(url: youtubeURL)
        webView.load(request)
    }
}

#Preview {
    YouTubePlayerView(videoID: "ea5Y7zEp3OI")
}
