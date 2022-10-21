//
//  WaitingPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.10.2022.
//

import UIKit


protocol WaitingRoomPresenter: AnyObject {
    func cancelWaiting()
    func startTheSession(with roomId: String)
}

class WaitingPage: UIViewController, Colors {
    
    weak var presenter: WaitingRoomPresenter?
    private var isAdmin: Bool
    private var waitingViewModels: WaitingRoomViewModels
    private lazy var center: CGPoint = {
        CGPoint(x: view.center.x - EPConstants.padding, y: view.center.y * 1.4)
    }()
    private var animations = {}
    
    init() {
        self.isAdmin = false
        self.waitingViewModels = WaitingRoomViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        
        setupViews()
        waitingViewModels.startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        waitingViewModels.cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        waitingViewModels.setCenterForStartButton(at: center)
        waitingViewModels.startAnimation()
    }
    
    private func setupViews() {
        let waitingView = waitingViewModels.waitingView
        view.addSubview(waitingView)
        
        NSLayoutConstraint.activate([
            waitingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            waitingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            waitingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            waitingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -EPConstants.padding),
        ])
    }
    
    @objc func handleCancelButton() {
        presenter?.cancelWaiting()
    }
    
    @objc func handleStartButton() {
        let _ = "H2EN84"

//        presenter?.startTheSession(with: roomId)
    }
    
    func setInitialData(roomId: String, isAdmin: Bool) {
        self.isAdmin = isAdmin
        waitingViewModels.startButton.isHidden = !isAdmin
        waitingViewModels.secondLogoImage.isHidden = isAdmin
    }
    
    func startTheSession() {
        print("Start the session")
    }
}
