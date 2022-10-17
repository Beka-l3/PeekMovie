//
//  PasswordPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


protocol PasswordPagePresenter: AnyObject {
    func checkPassword(with password: String)
}

class PasswordPage: UIViewController, Colors {
    
    weak var presenter: PasswordPagePresenter?
    private let passwordViewModels: PasswordViewModels
    
    init() {
        passwordViewModels = PasswordViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        
        setupViews()
        passwordViewModels.passwordInput.delegate = self
        passwordViewModels.continueButton.addTarget(self, action: #selector(handleContinueButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = yellow
    }
    
    private func setupViews() {
        let passwordView = passwordViewModels.passwordView
        view.addSubview(passwordView)
        
        NSLayoutConstraint.activate([
            passwordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            passwordView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: EPConstants.padding),
            
        ])
    }
    
    @objc func handleContinueButton() {
        let password = passwordViewModels.passwordInput.text ?? EPConstants.emptyText
        presenter?.checkPassword(with: password)
    }
    
    func setInputFieldWith(with state: Bool) {
        let placeholder = state ? EPConstants.passwordInputPlaceholder : EPConstants.incorrectPasswordInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        passwordViewModels.passwordInput.text = EPConstants.emptyText
        passwordViewModels.passwordInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        passwordViewModels.passwordInput.attributedPlaceholder = placeholderText
    }
}

extension PasswordPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldWith(with: true)
    }
}
