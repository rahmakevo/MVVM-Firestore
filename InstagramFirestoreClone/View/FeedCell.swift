//
//  FeedCell.swift
//  InstagramFirestoreClone
//
//  Created by Kevin Siundu on 10/12/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("venom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let postIV = UIImageView()
        postIV.contentMode = .scaleAspectFit
        postIV.clipsToBounds = true
        postIV.isUserInteractionEnabled = true
        return postIV
    }()
    
    private lazy var likeButton: UIButton = {
        let likeBtn = UIButton(type: .system)
        likeBtn.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        likeBtn.tintColor = .black
        return likeBtn
    }()
    
    private lazy var commentButton: UIButton = {
        let commentBtn = UIButton(type: .system)
        commentBtn.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        commentBtn.tintColor = .black
        return commentBtn
    }()
    
    private lazy var shareButton: UIButton = {
        let shareBtn = UIButton(type: .system)
        shareBtn.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        shareBtn.tintColor = .black
        return shareBtn
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "I like"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let captionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text caption for now..."
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private var stackView = UIStackView()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(
            top: topAnchor,
            left: leftAnchor,
            paddingTop: 12,
            paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(
            inView: profileImageView,
            leftAnchor: profileImageView.rightAnchor,
            paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(
            top: profileImageView.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(
            top: likeButton.bottomAnchor,
            left: leftAnchor,
            paddingTop: -4,
            paddingLeft: 8
        )
        
        addSubview(captionsLabel)
        captionsLabel.anchor(
            top: likesLabel.bottomAnchor,
            left: leftAnchor,
            paddingTop: 8,
            paddingLeft: 8
        )
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(
            top: captionsLabel.bottomAnchor,
            left: leftAnchor,
            paddingTop: 8,
            paddingLeft: 8,
            paddingBottom: 8
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func didTapUsername() {
        print("DEBUG: did tap username")
    }
    
    // MARK: - Helpers
    
    func configureActionButtons() {
        
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(
            top: postImageView.bottomAnchor,
            width: 120,
            height: 50)
    }
}
