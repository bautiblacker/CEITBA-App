//
//  BeneficiosController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 9/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class BeneficiosController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
//        addBenefits()
    }
    
    @objc func handleMenuToggle() {
            delegate?.handleMenuToggle()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "CEITBA"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
//    func addBenefits() {
//        addButtonsUsingStackView()
//    }
//
//    func addButtonsUsingStackView()
//    {
//        //create stackview:
//        let stackView=UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.alignment = .fill
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(stackView)
//
//        //stackview constraints:
//        let viewsDictionary = ["stackView":stackView]
//        let stackView_H = NSLayoutConstraint.constraints(
//            withVisualFormat: "H:|-20-[stackView]-20-|",
//            options: NSLayoutConstraint.FormatOptions(rawValue: 0),
//            metrics: nil,
//            views: viewsDictionary)
//        let stackView_V = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|-30-[stackView]-30-|",
//            options: NSLayoutConstraint.FormatOptions(rawValue:0),
//            metrics: nil,
//            views: viewsDictionary)
//        view.addConstraints(stackView_H)
//        view.addConstraints(stackView_V)
//
//        //adding buttons to stackview:
//        let buttonArray=["Button 1","Button 2","Button 3"," Button 4"]
//
//        for buttonName in buttonArray{
//
//            let button = UIButton()
//            button.setTitle(buttonName, for: .normal)
//            button.setTitleColor(UIColor.white, for: .normal)
//            button.backgroundColor = .blue
//            button.translatesAutoresizingMaskIntoConstraints = false
//
//            stackView.addArrangedSubview(button)
//
//        }
//
//    }

}
