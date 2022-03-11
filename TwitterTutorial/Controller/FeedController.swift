//
//  FeedController.swift
//  TwitterTutorial
//
//  Created by haeseongJung on 2022/03/10.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: Contents.twitterLogoBlue))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
