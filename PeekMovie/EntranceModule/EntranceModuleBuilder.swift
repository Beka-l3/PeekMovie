//
//  EntranceModuleBuilder.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import Foundation
import UIKit


final class EntranceModuleBuilder {
    
    var view: UIViewController
    var presenter: EntranceModulePresenter
    
    var appCoordinator: AppCoordinator?
//    var networkClient: NetworkClient
    
    private let entrancePage: EntrancePage
    private let authorizedPage: AuthorizedPage
    private let unAuthorizedPage: LoginPage
    
    private let passwordPage: PasswordPage
    private let registerPage: RegisterPage
    private let waitingPage: WaitingPage
    
    init(isLoggedIn: Bool) {
        entrancePage = EntrancePage()
        view = entrancePage
        
        authorizedPage = AuthorizedPage()
        unAuthorizedPage = LoginPage()
        passwordPage = PasswordPage()
        registerPage = RegisterPage()
        waitingPage = WaitingPage()
        
        presenter = EntranceModulePresenter(
            entrancePage: entrancePage,
            authorizedPage: authorizedPage,
            unAuthorizedPage: unAuthorizedPage,
            isLoggedIn: isLoggedIn,
            passwordPage: passwordPage,
            registerPage: registerPage,
            waitingPage: waitingPage
        )
        presenter.appCoordinator = appCoordinator
        
        entrancePage.presenter = presenter
        unAuthorizedPage.presenter = presenter
        passwordPage.presenter = presenter
        registerPage.presenter = presenter
        authorizedPage.presenter = presenter
        waitingPage.presenter = presenter
    }
}
