import SwiftUI
import GoogleMaps

@main
struct AppEnTransparencia: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup{
            ContentView(viewRouter: ViewRouter()).environmentObject(viewModel)
        }
    }
}
