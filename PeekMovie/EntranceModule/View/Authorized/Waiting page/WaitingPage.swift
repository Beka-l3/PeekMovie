//
//  WaitingPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.10.2022.
//

import UIKit


protocol WaitingRoomPresenter: AnyObject {
    func cancelWaiting(isAdmin: Bool)
    func startTheSession(with roomId: String)
}

class WaitingPage: UIViewController, Colors, Informatives {
    
    weak var presenter: WaitingRoomPresenter?
    
    internal var webSocket: URLSessionWebSocketTask?
    internal var admin: String
    internal var usernames: [String]
    internal var roomId: String
    
    private var isAdmin: Bool
    private var waitingViewModels: WaitingRoomViewModels
    private lazy var center: CGPoint = {
        CGPoint(x: view.center.x - EPConstants.padding, y: view.center.y * 1.4)
    }()
    private var animations = {}
    private lazy var infoPopLabel: UILabel = {getInfoPop()}()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        self.admin = ""
        self.usernames = []
        self.roomId = ""
        self.isAdmin = false
        self.waitingViewModels = WaitingRoomViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        
        setupViews()
        waitingViewModels.usersPickerView.delegate = self
        waitingViewModels.usersPickerView.dataSource = self
        waitingViewModels.startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        waitingViewModels.cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        waitingViewModels.setCenterForStartButton(at: center)
        waitingViewModels.startAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        infoPopLabel.center = EPConstants.infoPopCenter
        waitingViewModels.usersPickerView.reloadAllComponents()
    }

    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        changeActivityIndicatorState(toActive: false)
    }
    
    private func setupViews() {
        let waitingView = waitingViewModels.waitingView
        view.addSubview(waitingView)
        view.addSubview(infoPopLabel)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            waitingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            waitingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            waitingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            waitingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -EPConstants.padding),
        ])
    }
    
    @objc func handleCancelButton() {
        close(isAdmin: self.isAdmin)
        presenter?.cancelWaiting(isAdmin: isAdmin)
    }
    
    @objc func handleStartButton() {
        let roomId = UserDefaults.standard.string(forKey: GConstants.roomIdKey) ?? waitingViewModels.roomIDLabel.text ?? ""
        presenter?.startTheSession(with: roomId)
    }
    
    func setInitialData(roomData: RoomDTO, isAdmin: Bool) {
        self.isAdmin = isAdmin
        self.admin = roomData.admin
        self.usernames = setUsernames(users: roomData.users, admin: roomData.admin)
        self.roomId = roomData.roomId
        
        waitingViewModels.roomIDLabel.text = roomData.roomId
        waitingViewModels.startButton.isHidden = !isAdmin
        waitingViewModels.secondLogoImage.isHidden = isAdmin
    }
    
    func popInfoLabel(type: InfoPopType, completion: @escaping () -> Void = {}) {
        changeActivityIndicatorState(toActive: false)
        var text = ""
        var detail = ""
        var infoType: InformativeType = .tip
        
        switch type {
        case .roomStart:
            presenter?.startTheSession(with: self.roomId)
        case .adminOut:
            presenter?.cancelWaiting(isAdmin: false)
        case .userJoin(let username):
            text = InfoPops.welcome + username
            detail = InfoPops.userJoined
            usernames.append(username)
            waitingViewModels.usersPickerView.reloadAllComponents()
            waitingViewModels.usersPickerView.selectRow(usernames.count - 1, inComponent: .zero, animated: true)
        case .userLeft(let username):
            text = InfoPops.goodbye + username
            detail = InfoPops.userQuit
            if let idx = usernames.firstIndex(of: username) {
                usernames.remove(at: idx)
                waitingViewModels.usersPickerView.reloadAllComponents()
                waitingViewModels.usersPickerView.selectRow(.zero, inComponent: .zero, animated: true)
            }
        case .connectionError:
            text = InfoPops.connectionError
            detail = InfoPops.tryLater
        case .serverError:
            text = InfoPops.serverError
            detail = InfoPops.tryLater
        default:
            text = InfoPops.internalError
            detail = InfoPops.waitUpdate
            infoType = .wrong
        }
        infoPopLabel.attributedText = getAttributedText(
            text: text,
            detail: detail,
            type: infoType
        )
        animateInfoPop(label: infoPopLabel, completion: completion)
    }
    
    func changeActivityIndicatorState(toActive: Bool) {
        if toActive { activityIndicator.startAnimating() }
        else { activityIndicator.stopAnimating() }
    }
    
    private func setUsernames(users: [String], admin: String) -> [String] {
        var u = users
        u.remove(at: u.firstIndex(of: admin)!)
        return [admin] + u
    }
}
