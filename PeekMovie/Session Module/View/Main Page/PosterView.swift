//
//  PosterView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit


protocol PosterViewDelegate: AnyObject {
    
}

class PosterViewPage: UIViewController, Colors {
    
    weak var presenter: PosterViewDelegate?
    private var posterViewModels: PosterViewModels
    
    init() {
        self.posterViewModels = PosterViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
//  MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        posterViewModels.infoButton.addTarget(self, action: #selector(handleInfoButton), for: .touchUpInside)
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handlePress))
        longPress.minimumPressDuration = .zero
        view.addGestureRecognizer(longPress)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // MARK: animation FIX ME PLEASE
        
        let posterViewSize = CGSize(width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height - 8)
        let scale = posterViewSize.height / posterViewModels.posterImage.image!.size.height
        let newSize = CGSize(width: posterViewModels.posterImage.image!.size.width * scale, height: posterViewModels.posterImage.image!.size.height * scale)
        var offset: CGFloat = .zero
        if posterViewModels.posterImage.frame.origin == .zero {
            offset = newSize.width - posterViewSize.width
        }
        
        UIView.animate(withDuration: 12, delay: 1, options: [.repeat, .autoreverse]) {
            self.posterViewModels.posterImage.frame.origin = CGPoint(x: -offset, y: 0)
        }
    }
    
//  MARK: - objc
    @objc func handlePress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            pauseLayer(layer: posterViewModels.posterImage.layer)
        } else if gesture.state == .ended {
            resumeLayer(layer: posterViewModels.posterImage.layer)
        }
    }
    
    @objc func handleInfoButton() {
        let opacity = posterViewModels.movieInfoView.scrollView.layer.opacity
        UIView.animate(withDuration: 0.8, delay: 0, options: []) {
            self.posterViewModels.movieInfoView.scrollView.layer.opacity = 1 - opacity
        }
    }
    
//  MARK: - func
    private func setupViews() {
        let posterView = posterViewModels.posterView
        view.addSubview(posterView)
        view.addSubview(posterViewModels.infoButton)
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -8),
            posterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            posterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            posterViewModels.infoButton.widthAnchor.constraint(equalToConstant: 20),
            posterViewModels.infoButton.heightAnchor.constraint(equalToConstant: 20),
            posterViewModels.infoButton.trailingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: -16),
            posterViewModels.infoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
    }
    
    private func setupLayers() {
        let posterViewSize = CGSize(width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height - 8)
        posterViewModels.setupLayers(size: posterViewSize)
        posterViewModels.setData(frameSize: posterViewSize)
        
        let tabBarHeight = (tabBarController?.tabBar.frame.height ?? 0) + 12
        let yellowFadeHeight = CGFloat(8)
        posterViewModels.yellowFadeBottom.zPosition = -1
        posterViewModels.yellowFadeBottom.frame.size = CGSize(width: view.frame.width, height: yellowFadeHeight)
        posterViewModels.yellowFadeBottom.frame.origin = CGPoint(x: 0, y: view.frame.height - tabBarHeight)
        view.layer.addSublayer(posterViewModels.yellowFadeBottom)
    }
    
    func pauseLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }

    func resumeLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
}
