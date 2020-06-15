//
//  Coordinator.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navController: UINavigationController{ get set}
    
    func start ()
    
}
