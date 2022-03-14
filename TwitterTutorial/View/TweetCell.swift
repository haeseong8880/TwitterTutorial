//
//  TweetCell.swift
//  TwitterTutorial
//
//  Created by haeseongJung on 2022/03/13.
//

import UIKit

protocol TweetCellDelegate: class {
    func handleProfileImageTapped ()
}

class TweetCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var tweet: Tweet? {
        didSet { congifure() }
    }
    
    weak var delegate: TweetCellDelegate?
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        iv.addGestureRecognizer(tap)
        iv.isUserInteractionEnabled = true
        
        return iv
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Some test caption"
        return label
    }()
    
    let contents = Contents.TweetCell.self
    
    private lazy var commentButton =
    makeButton(iconName: contents.comment, action: #selector(handleCommentTapped))
    
    private lazy var retweetButton =
    makeButton(iconName: contents.retweet, action: #selector(handleRetweetTapped))
    
    private lazy var likeButton =
    makeButton(iconName: contents.like, action: #selector(handleLikeTapped))
    
    private lazy var shareButton =
    makeButton(iconName: contents.share, action: #selector(handleShareTapped))
    
    func makeButton(iconName: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: iconName), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    private let infoLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        let stack = UIStackView(arrangedSubviews: [ infoLabel, captionLabel ])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.text = "Eddie Brock @Joker"
        
        let actionStack = UIStackView(arrangedSubviews: [ commentButton, retweetButton, likeButton, shareButton])
        
        actionStack.axis = .horizontal
        actionStack.spacing = 72
        
        addSubview(actionStack)
        actionStack.centerX(inView: self)
        actionStack.anchor(bottom: bottomAnchor, paddingBottom: 8)
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleProfileImageTapped() {
        delegate?.handleProfileImageTapped()
    }
    
    @objc func handleCommentTapped(){
        print("DEBUG: handleComment Click!!")
    }
    
    @objc func handleRetweetTapped() {
        print("DEBUG: handleRetweet Click!!!")
    }
    
    @objc func handleLikeTapped(){
        print("DEBUG: handleLike Click!!!")
    }
    
    @objc func handleShareTapped() {
        print("DEBUG: handleShare Click!!!")
    }
    
    // MARK: - Helpers
    
    func congifure() {
        guard let tweet = tweet else { return }
        let viewModel = TweetViewModel(tweet: tweet)
        
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        captionLabel.text = tweet.caption
        infoLabel.attributedText = viewModel.userInfoText
    }
    
}
