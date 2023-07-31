//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Đinh Thái Sơn on 28/07/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Spotify"
        view.backgroundColor = .systemGreen
        
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapsignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50
        )
    }
    
    @objc func didTapsignIn() {
        let vc = AuthViewController()
        vc.completionHandler = {[weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(success: Bool) {
        //Log user in or yell at them for error
        
    }
}
