//
//  HomeView.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import UIKit

class HomeView: UITabBarController {
    var presenter: ViewToPresenterHomeProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.delegate = self
        self.title = "Events"
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        let eventTab = EventWireFrame.createEventModule()
        let eventBarItem = UITabBarItem(title: "Events", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        eventTab.tabBarItem = eventBarItem
        
        
        let scheduleTab = ScheduleWireFrame.createScheduleModule()
        let scheduleBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "clock"), selectedImage: UIImage(systemName: "clock.fill"))
        scheduleTab.tabBarItem = scheduleBarItem
        
        self.viewControllers = [eventTab, scheduleTab]
    }
}
extension HomeView: UITabBarControllerDelegate {
    // UITabBarControllerDelegate method
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           let index = self.viewControllers?.index(of: viewController)!
           
           self.title = index == 0 ? "Events": "Schedule"
           
          
       }
    
}
extension HomeView: PresenterToViewHomeProtocol {}
