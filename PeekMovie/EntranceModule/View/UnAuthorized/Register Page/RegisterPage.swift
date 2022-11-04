//
//  RegisterPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.10.2022.
//

import UIKit


protocol RegisterPagePresenter: AnyObject {
    func checkRegistrationData(with id: RegistrationFormDTO)
}

class RegisterPage: UIViewController, Colors, Informatives {
    
    weak var presenter: RegisterPagePresenter?
    private var registerViewModels: RegisterPageViewModels
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    
    init() {
        self.registerViewModels = RegisterPageViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        
        setupViews()
        registerViewModels.usernameInput.delegate = self
        registerViewModels.emailInput.delegate = self
        registerViewModels.passwordInput.delegate = self
        registerViewModels.registerButton.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = yellow
        infoPopLabel.center = EPConstants.infoPopCenter
    }
    
    private func setupViews() {
        let registerView = registerViewModels.registerView
        view.addSubview(registerView)
        view.addSubview(infoPopLabel)
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: EPConstants.smallPadding),
            registerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            registerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            registerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: EPConstants.padding)
        ])
    }
    
    @objc func handleRegisterButton() {
        let id = RegistrationFormDTO(
            username: registerViewModels.usernameInput.text ?? EPConstants.emptyText,
            email: registerViewModels.emailInput.text ?? EPConstants.emptyText,
            password: registerViewModels.passwordInput.text ?? EPConstants.emptyText
        )
        
        presenter?.checkRegistrationData(with: id)
    }
    
    func setInputFieldsState(with state: Bool) {
        print("Something is incorrect =)")
    }
    
    func popInfoLabel(type: InfoPopType) {
        infoPopLabel.attributedText = getAttributedText(
            text: "Try again!",
            detail: "Something went wrong.",
            type: .wrong
        )
        animateInfoPop(label: infoPopLabel)
    }
}

extension RegisterPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldsState(with: true)
    }
}
