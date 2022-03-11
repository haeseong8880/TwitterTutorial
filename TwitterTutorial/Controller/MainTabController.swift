//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by haeseongJung on 2022/03/10.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.setImage(UIImage(named: Contents.newTwitter), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTabBarSetting()
        configureViewControllers()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func actionButtonTapped(){
        print("11111111")
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
        actionButton.backgroundColor = .twitterBlue
    }
    
    func configureViewControllers(){
        
        let feed = templateNavigationController(image: UIImage(named: Contents.BottomSheetIcon.homeUnselected)!, rootViewController: FeedController())
        let explore = templateNavigationController(image: UIImage(named: Contents.BottomSheetIcon.searchUnselected)!, rootViewController: ExploreController())
        let notifications = templateNavigationController(image: UIImage(named: Contents.BottomSheetIcon.likeUnselected)!, rootViewController: NotificationsController())
        let conversations = templateNavigationController(image: UIImage(named: Contents.BottomSheetIcon.mailUnselected)!, rootViewController: ConversationsController())
        
        viewControllers = [feed, explore, notifications, conversations]
    }
    
    func templateNavigationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
    func uiTabBarSetting() {
        if #available(iOS 15.0, *){
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}
