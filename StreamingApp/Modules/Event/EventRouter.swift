//
//  EventRouter.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation
import UIKit
import AVKit

class EventRouter: PresenterToRouterEventProtocol {

    var view: UIViewController?
    func playback(videoUrl: String) {
        print(videoUrl)
        
        let player = AVPlayer(url: URL(string:videoUrl)!)
        let vc = AVPlayerViewController()
        vc.player = player

        view?.present(vc, animated: true) {
            vc.player?.play()
        }
    }
}
