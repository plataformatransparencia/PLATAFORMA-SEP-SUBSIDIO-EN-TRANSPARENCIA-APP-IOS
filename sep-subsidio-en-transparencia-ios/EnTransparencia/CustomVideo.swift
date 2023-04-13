import SwiftUI
import AVKit

struct CustomVideo: View {
    @State var player = AVPlayer(url: URL(string: "")!)
    @State var isPlaying = false
    @State var showControls = false
    
    var body: some View {
        VStack{
            ZStack{
                VideoPlayer(player: $player)
                
                if self.showControls{
                    Controls(player: self.$player, isPlaying: self.$isPlaying, pannel: self.$showControls)
                }
            }.frame(height: UIScreen.main.bounds.height / 4)
            .onTapGesture {
                self.showControls = true
            }
            Spacer()
        }.padding(.bottom)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .onAppear{
            self.player.pause()
            self.isPlaying = false
        }
    }
}

struct CustomVideo_Previews: PreviewProvider {
    static var previews: some View {
        CustomVideo()
    }
}

struct Controls : View {
    @Binding var player : AVPlayer
    @Binding var isPlaying : Bool
    @Binding var pannel: Bool
    @State var value:Float = 0
    
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    if self.isPlaying{
                        self.player.pause()
                        self.isPlaying = false
                    }
                    else{
                        self.player.play()
                        self.isPlaying = true
                    }
                }){
                    Image(systemName: self.isPlaying ? "pause.fill" :  "play.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                }
                Spacer()
            }
            Spacer()
            CustomProgressBar(value: self.$value, player: self.$player, isplaying: self.$isPlaying)
        }.padding()
        .background(Color.black.opacity(0.3))
        .onTapGesture {
            self.pannel = false
        }
        .onAppear{
            self.player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main){(_) in
                self.value = self.getSliderValue()
            }
        }
    }
    func getSliderValue() ->Float{
        return Float(self.player.currentTime().seconds / (self.player.currentItem?.duration.seconds)!)
    }
}
struct CustomProgressBar: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomProgressBar.Coordinator(parent1: self)
    }
    @Binding var value : Float
    @Binding var player: AVPlayer
    @Binding var isplaying : Bool
    
    func makeUIView(context: UIViewRepresentableContext<CustomProgressBar>) -> UISlider {
        let slider = UISlider()
        slider.minimumTrackTintColor = UIColor(Color("verde1"))
        slider.maximumTrackTintColor = UIColor(Color("grisClaro"))
        //slider.setThumbImage(UIImage("thumb"), for: .normal)
        slider.value = value
        slider.addTarget(context.coordinator, action: #selector(context.coordinator.changed(slider:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<CustomProgressBar>) {
        uiView.value = value
    }
    
    class Coordinator: NSObject {
        var parent : CustomProgressBar
        init(parent1: CustomProgressBar){
            parent = parent1
        }
        @objc func changed(slider: UISlider){
            if slider.isTracking{
                parent.player.pause()
                let sec = Double(slider.value * Float((parent.player.currentItem?.duration.seconds)!))
                parent.player.seek(to: CMTime(seconds: sec, preferredTimescale: 1))
            }else{
                parent.player.pause()
                let sec = Double(slider.value * Float((parent.player.currentItem?.duration.seconds)!))
                parent.player.seek(to: CMTime(seconds: sec, preferredTimescale: 1))
                if parent.isplaying {
                    parent.player.play()
                }
            }
        }
    }
}

struct VideoPlayer: UIViewControllerRepresentable {
    @Binding var player : AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resize
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>) {
        
    }
}
