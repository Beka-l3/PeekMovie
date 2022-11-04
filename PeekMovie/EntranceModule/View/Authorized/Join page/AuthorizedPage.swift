//
//  ViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import UIKit

protocol AuthorizedPagePresenter: AnyObject {
    func pushWaitingRoom(with roomId: String, isAdmin: Bool)
    func logOut()
}

class AuthorizedPage: UIViewController, Colors, Informatives {

    weak var presenter: AuthorizedPagePresenter?
    private let joinRoomView: AuthorizedPageViewModels
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    
    init() {
        self.joinRoomView = AuthorizedPageViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        joinRoomView.roomIdInput.delegate = self
        joinRoomView.joinButton.addTarget(self, action: #selector(handleJoinButton), for: .touchUpInside)
        joinRoomView.createButton.addTarget(self, action: #selector(handleCreateButton), for: .touchUpInside)
        joinRoomView.logOutButton.addTarget(self, action: #selector(handleLogOutButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        infoPopLabel.center = EPConstants.infoPopCenter
    }

    private func setupViews() {
        let joinView = joinRoomView.joinRoomView
        view.addSubview(joinView)
        view.addSubview(infoPopLabel)
        NSLayoutConstraint.activate([
            joinView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: EPConstants.smallPadding),
            joinView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            joinView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            joinView.bottomAnchor.constraint(equalTo: joinRoomView.createButton.bottomAnchor),
        ])
    }
    
    @objc func handleLogOutButton() {
        presenter?.logOut()
    }
    
    @objc func handleJoinButton() {
        presenter?.pushWaitingRoom(with: joinRoomView.roomIdInput.text ?? EPConstants.emptyText, isAdmin: false)
    }
    
    @objc func handleCreateButton() {
        presenter?.pushWaitingRoom(with: EPConstants.emptyText, isAdmin: true)
    }
    
    func setInputFieldWith(with state: Bool) {
        let placeholder = state ? EPConstants.roomIdIntupPlaceholder : EPConstants.incorrectRoomIdIntupPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        joinRoomView.roomIdInput.text = EPConstants.emptyText
        joinRoomView.roomIdInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        joinRoomView.roomIdInput.attributedPlaceholder = placeholderText
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

extension AuthorizedPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldWith(with: true)
    }
}
