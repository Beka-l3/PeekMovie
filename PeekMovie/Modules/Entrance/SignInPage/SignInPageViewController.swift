//
//  SignInPageViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit

final class SignInPageViewController: UIViewController {
    
    let viewComponents = SignInPageViewComponents()
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Task {
            do {
                try await Task.sleep(nanoseconds: 3 * 1000000000)
                await MainActor.run {
                    viewComponents.usernameTextField.startAnimation()
                }
            } catch {
                print("\nSleep error")
            }
        }
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
//    MARK:  private func
    private func setupViews() {
        viewComponents.setupViews(parent: view)
    }
    
}
