//
//  EntranceModuleBuilder.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import Foundation
import UIKit


final class EntranceModuleBuilderOld {
    
    var view: UIViewController
    var presenter: EntranceModulePresenter
    
//    var networkClient: NetworkClient
    
    private let authorizedPage: AuthorizedPage
    private let unAuthorizedPage: LoginPage
    
    private let passwordPage: PasswordPage
    private let registerPage: RegisterPage
    private let waitingPage: WaitingPage
    
    init(isLoggedIn: Bool, networkService: NetworkServiceOLD) {
        authorizedPage = AuthorizedPage()
        unAuthorizedPage = LoginPage()
        passwordPage = PasswordPage()
        registerPage = RegisterPage()
        waitingPage = WaitingPage()
        
        presenter = EntranceModulePresenter(
            authorizedPage: authorizedPage,
            unAuthorizedPage: unAuthorizedPage,
            passwordPage: passwordPage,
            registerPage: registerPage,
            waitingPage: waitingPage,
            networkService: networkService
        )
        view = presenter.getEntrancePage(isLoggedIn: isLoggedIn)
        
        unAuthorizedPage.presenter = presenter
        passwordPage.presenter = presenter
        registerPage.presenter = presenter
        authorizedPage.presenter = presenter
        waitingPage.presenter = presenter
    }
}
