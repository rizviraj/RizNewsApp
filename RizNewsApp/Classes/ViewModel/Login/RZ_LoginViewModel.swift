//
//  RZ_LoginViewModel.swift
//  RizNewsApp
//
//  Created by Mohamed Rizvi on 6/14/20.
//  Copyright © 2020 RizviOrganization. All rights reserved.
//

import Foundation
import HexColors
import RxSwift
import RxCocoa
import SwiftMessages

class RZ_LoginViewModel {
    weak var coordinator: LoginCoordinator?
    
    let disposeBag = DisposeBag()
    
    func changeBackColor (_ view: UIView) {
        view.backgroundColor = UIColor(RZ_Constant.RZ_Colors.APP_THEME_COLOR)
    }
    
    func setTextFieldLeftPadding (_ text: UITextField) {
        text.setLeftPaddingPoints(10)
    }
}
