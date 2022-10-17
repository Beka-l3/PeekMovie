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
    private let authorizedPage: AuthorizedPageController
    private let unAuthorizedPage: LoginPage
    
    private let passwordPage: PasswordPage
    private let registerPage: RegisterPageController
    
    init(isLoggedIn: Bool) {
        entrancePage = EntrancePage()
        authorizedPage = AuthorizedPageController()
        unAuthorizedPage = LoginPage()
        passwordPage = PasswordPage()
        registerPage = RegisterPageController()
        view = entrancePage
        
        presenter = EntranceModulePresenter(
            entrancePage: entrancePage,
            authorizedPage: authorizedPage,
            unAuthorizedPage: unAuthorizedPage,
            isLoggedIn: isLoggedIn,
            passwordPage: passwordPage,
            registerPage: registerPage
        )
        presenter.appCoordinator = appCoordinator
        
        entrancePage.presenter = presenter
        unAuthorizedPage.presenter = presenter
        passwordPage.presenter = presenter
        registerPage.presenter = presenter
    }
}
