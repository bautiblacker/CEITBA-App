//
//  ContainerController.swift
//  Bencraft
//
//  Created by Martin Craviotto on 9/3/19.
//  Copyright © 2019 Martin Craviotto. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDefaultController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    func configureDefaultController() {
        let defaultController = BeneficiosEspecificosController()
        defaultController.delegate = self
        centerController = UINavigationController(rootViewController: defaultController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            // Mostrar el Menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            // Esconder el Menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animatedStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Perfil:
            print("Perfil")
        case .Actividades:
            print("Actividades")
            let activitiesController = ActivitiesController()
            present(UINavigationController(rootViewController: activitiesController), animated: true, completion: nil)
        case .Beneficios:
            print("Beneficios")
        case .Cursos:
            print("Cursos")
        case .Deportes:
            print("Deportes")
        case .Gym:
            print("Gym")
        case .Idiomas:
            print("Idiomas")
        case .Kit:
            print("Kit")
        case .Lab:
            print("Lab")
        case .Lockers:
            print("Lockers")
        case .Contacto:
            print("Contacto")
        case .Settings:
            print("Settings")
        case .LogOut:
            print("LogOut")
        }
    }
    
    func animatedStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
