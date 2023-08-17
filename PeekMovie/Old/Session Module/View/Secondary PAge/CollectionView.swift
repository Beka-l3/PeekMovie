//
//  CollectionView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit


protocol CollectionViewDelegate: AnyObject {
    func getDataAmount() -> Int
    func getItem(at: Int) -> MovieDTO
    func quitFromRoom()
}

class CollectionViewPage: UIViewController, ColorsOld, Informatives {
    
    weak var presenter: CollectionViewDelegate?
    internal var collectionViewModels: CollectionViewModels
    private lazy var infoPopLabel: UILabel = {getInfoPop()}()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        self.collectionViewModels = CollectionViewModels()
        super.init(nibName: nil, bundle: nil)
    }; required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
//  MARK: -
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        collectionViewModels.collectionView.delegate = self
        collectionViewModels.collectionView.dataSource = self
        collectionViewModels.quitButton.addTarget(self, action: #selector(handleQuitFunction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        infoPopLabel.center = EPConstants.infoPopCenter
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        changeActivityIndicatorState(toActive: false)
    }
    
//  MARK: - func
    @objc func handleQuitFunction() {
        changeActivityIndicatorState(toActive: true)
        presenter?.quitFromRoom()
    }
    
//  MARK: - func
    func updateData() {
        collectionViewModels.collectionView.reloadData()
    }
    
//  MARK: -
    private func setupViews() {
        collectionViewModels.setupViews(parrent: view)
        view.addSubview(activityIndicator)
        view.addSubview(infoPopLabel)
    }
    
    private func changeActivityIndicatorState(toActive: Bool) {
        if toActive { activityIndicator.startAnimating() }
        else { activityIndicator.stopAnimating() }
    }
    
}
