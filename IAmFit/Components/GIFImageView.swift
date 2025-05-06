//
//  GIFImageView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI
import WebKit

struct GIFImageView: UIViewRepresentable {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    func makeUIView(context: Context) -> WKWebView {
            let webview = WKWebView()
            let url = Bundle.main.url(forResource: name, withExtension: "gif")!
            let data = try! Data(contentsOf: url)
            webview.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url.deletingLastPathComponent())
            return webview
        }
        func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.reload()
        }
}

#Preview {
    GIFImageView(name: "")
}
