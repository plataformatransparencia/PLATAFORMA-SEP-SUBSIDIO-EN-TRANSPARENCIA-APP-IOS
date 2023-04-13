//
//  WebView.swift
//  EnTransparencia
//
//  Created by Beatriz de la Rosa on 18/03/21.
//

import Foundation
import SwiftUI
import WebKit

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

class WebViewStateModel: ObservableObject {
}

struct WebView: View {
    enum NavigationAction {
        case decidePolicy(WKNavigationAction,  (WKNavigationActionPolicy) -> Void) //mendetory
        case didRecieveAuthChallange(URLAuthenticationChallenge,
            (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) //mendetory
        case didStartProvisionalNavigation(WKNavigation)
        case didReceiveServerRedirectForProvisionalNavigation(WKNavigation)
        case didCommit(WKNavigation)
        case didFinish(WKNavigation)
        case didFailProvisionalNavigation(WKNavigation,Error)
        case didFail(WKNavigation,Error)
        
    }
    @ObservedObject var webViewStateModel: WebViewStateModel
    private var actionDelegate: ((_ navigationAction: WebView.NavigationAction) -> Void)?
    
    let uRLRequest: URLRequest
    
    var body: some View {
        
        WebViewWrapper(webViewStateModel: webViewStateModel,
                       action: actionDelegate,
                       request: uRLRequest)
    }
    init(uRLRequest: URLRequest, webViewStateModel: WebViewStateModel, onNavigationAction: ((_ navigationAction: WebView.NavigationAction) -> Void)?) {
        self.uRLRequest = uRLRequest
        self.webViewStateModel = webViewStateModel
        self.actionDelegate = onNavigationAction
    }
    
    init(url: URL, webViewStateModel: WebViewStateModel, onNavigationAction: ((_ navigationAction: WebView.NavigationAction) -> Void)? = nil) {
        self.init(uRLRequest: URLRequest(url: url),
                  webViewStateModel: webViewStateModel,
                  onNavigationAction: onNavigationAction)
    }
}



final class WebViewWrapper : UIViewRepresentable {
    @ObservedObject var webViewStateModel: WebViewStateModel
    let action: ((_ navigationAction: WebView.NavigationAction) -> Void)?
    
    let request: URLRequest
    
    init(webViewStateModel: WebViewStateModel,
         action: ((_ navigationAction: WebView.NavigationAction) -> Void)?,
         request: URLRequest) {
        self.action = action
        self.request = request
        self.webViewStateModel = webViewStateModel
    }
    
    
    func makeUIView(context: Context) -> WKWebView  {
        let view = WKWebView()
        view.navigationDelegate = context.coordinator
        view.load(request)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(action: action, webViewStateModel: webViewStateModel)
    }
    
    final class Coordinator: NSObject {
        @ObservedObject var webViewStateModel: WebViewStateModel
        let action: ((_ navigationAction: WebView.NavigationAction) -> Void)?
        
        init(action: ((_ navigationAction: WebView.NavigationAction) -> Void)?,
             webViewStateModel: WebViewStateModel) {
            self.action = action
            self.webViewStateModel = webViewStateModel
        }
        
    }
}


extension WebViewWrapper.Coordinator: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated {
            if let url = navigationAction.request.url,
                let host = url.host, host.hasPrefix("https://example.com"),
                UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url)
                print(url)
                print("Redireccionando a safari")
                decisionHandler(.cancel)
            }else if let url = navigationAction.request.url,
                UIApplication.shared.canOpenURL(url) , url.scheme == "tel:", url.scheme == "mailto:"{
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                UIApplication.shared.open(url)
                print(url)
                 print("Tratando de abir en tel o mail")
                decisionHandler(.cancel)
            }
            else{
                print("Abriendo en local")
                decisionHandler(.allow)
            }
        }else{
            print("not a user click")
            decisionHandler(.allow)
        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
        action?(.didStartProvisionalNavigation(navigation))
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation: \(navigation.debugDescription)")
        action?(.didReceiveServerRedirectForProvisionalNavigation(navigation))
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        action?(.didFailProvisionalNavigation(navigation, error))
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        action?(.didCommit(navigation))
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("page finished load")
        action?(.didFinish(navigation))
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error:
        Error) {
        action?(.didFail(navigation, error))
    }
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if action == nil  {
            completionHandler(.performDefaultHandling, nil)
        } else {
            action?(.didRecieveAuthChallange(challenge, completionHandler))
        }
        
    }
}


