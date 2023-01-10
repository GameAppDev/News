//
//  WebRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import UIKit

final class WebRouter {
    
    public func returnVC(url: URL) -> UIViewController {
        return WebBuilder.buildModule(url: url)
    }
}

extension WebRouter: PWebPresenterToRouter { }
