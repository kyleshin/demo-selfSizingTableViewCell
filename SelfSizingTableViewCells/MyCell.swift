//
//  MyCell.swift
//  SelfSizingTableViewCells
//
//  Created by Kyle Shin on 1/2/19.
//  Copyright © 2019 Kyle Shin. All rights reserved.
//


import UIKit

class MyCell: UITableViewCell {
    
    let profileImageView = UIImageView()
    let name : UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textColor = .black
        
        //important for self sizing
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        label.numberOfLines = 0

        return label
    }()
    let body : UITextView = {
        let view = UITextView()
        view.isEditable = false
        view.textColor = .black
        view.backgroundColor = .green
        view.isSelectable = false
        
        //important for self sizing
        view.adjustsFontForContentSizeCategory = true
        view.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        view.isScrollEnabled = false

        return view
    }()
    let upvoteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "upvote"), for: .normal)
        return button
    }()
    let downvoteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "downvote"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViewsForLayout(views: profileImageView, name, body, upvoteButton,downvoteButton)
        backgroundColor = .white
        
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareViewsForLayout(views: profileImageView, name, body, upvoteButton,downvoteButton)
        backgroundColor = .white
        layout()
    }
    
    /** Layout the UI. It's import we have a chain of layouts from top and leading side to bottom and trailing size. Notice the name and body doesn't have height constraint.
    */
    func layout(){

        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 6).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        name.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        name.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 5).isActive = true
        name.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        body.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5).isActive = true
        body.leadingAnchor.constraint(equalTo: name.leadingAnchor, constant: 0).isActive = true
        body.trailingAnchor.constraint(equalTo: name.trailingAnchor, constant: 0).isActive = true
        
        //we will place the upvote and downvote buttons into this stackview
        let buttonStackView = UIStackView(arrangedSubviews: [upvoteButton,downvoteButton])
        prepareViewsForLayout(views:buttonStackView)
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        buttonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 55 ).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        buttonStackView.topAnchor.constraint(equalTo: body.bottomAnchor, constant: 0).isActive = true
    }
    
    /** Convenience Method.
    */
    private func prepareViewsForLayout(views: UIView...){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
}
