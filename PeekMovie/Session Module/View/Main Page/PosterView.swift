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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemPurple
        view.backgroundColor = black
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let posterViewSize = CGSize(width: view.frame.width - 64, height: view.safeAreaLayoutGuide.layoutFrame.height - 40)
        posterViewModels.setupLayers(size: posterViewSize)
        posterViewModels.setData(frameSize: posterViewSize)
        
        setupLayers()
        posterViewModels.infoButton.addTarget(self, action: #selector(handleInfoButton), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        // MARK: animation FIX ME PLEASE
        
        let posterViewSize = CGSize(width: view.frame.width - 64, height: view.safeAreaLayoutGuide.layoutFrame.height - 40)
        let scale = posterViewSize.height / posterViewModels.posterImage.image!.size.height
        let newSize = CGSize(width: posterViewModels.posterImage.image!.size.width * scale, height: posterViewModels.posterImage.image!.size.height * scale)
        let offset = newSize.width - posterViewSize.width
        
        
        UIView.animate(withDuration: 10, delay: 1, options: [.repeat, .autoreverse]) {
            self.posterViewModels.posterImage.frame.origin = CGPoint(x: -offset, y: 0)
        }
    }
    
    
    
    private func setupViews() {
        let posterView = posterViewModels.posterView
        view.addSubview(posterView)
        view.addSubview(posterViewModels.infoButton)
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -8),
            posterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            posterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            posterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
        ])
    }
    
    
    private func setupLayers() {
        let tabBarHeight = (tabBarController?.tabBar.frame.height ?? 0) + 32
        let yellowFadeHeight = CGFloat(32)
        posterViewModels.yellowFadeBottom.zPosition = -1
        posterViewModels.yellowFadeBottom.frame.size = CGSize(width: view.frame.width, height: yellowFadeHeight)
        posterViewModels.yellowFadeBottom.frame.origin = CGPoint(x: 0, y: view.frame.height - tabBarHeight)
        view.layer.addSublayer(posterViewModels.yellowFadeBottom)
    }
    
    @objc func handleInfoButton() {
        // MARK: FIX ME PLEASE
        
        let opacity = posterViewModels.movieInfoView.scrollView.layer.opacity
        
        UIView.animate(withDuration: 0.8, delay: 0, options: []) {
            self.posterViewModels.movieInfoView.scrollView.layer.opacity = 1 - opacity
            self.posterViewModels.movieInfoView.whiteFadeBackground.opacity = 1 - opacity
        }
        
    }
}
