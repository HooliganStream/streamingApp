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
        print("View did Load")
    }
}
extension HomeView: PresenterToViewHomeProtocol {

}
