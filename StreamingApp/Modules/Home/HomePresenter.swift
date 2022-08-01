//
//  HomePresenter.swift
//  StreamingApp
//
//  Created by FGX on 2022/08/01.
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func viewDidLoad() {
    }
}

extension HomePresenter : InteractorToPresenterHomeProtocol {
    
}
