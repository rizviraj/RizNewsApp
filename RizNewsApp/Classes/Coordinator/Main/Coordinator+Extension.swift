//
//  Coordinator+Extension.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/15/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import Foundation

extension Coordinator {
    /*----------------==========--------------------//
     Remove child coordinator
    ----------------==========--------------------*/
    func childDidFinish (_ child: Coordinator?)  {
        for(index, coodinator) in childCoordinators.enumerated() {
            if coodinator === child {
                //print(childCoordinators)
                childCoordinators.remove(at: index)
                print(childCoordinators)
                print("Child removed")
                break
            }
        }
    }
    
}
