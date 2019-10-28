//
//  WaitingViewController.swift
//  tech-task
//
//  Created by Leighroy on 28/10/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import UIKit

class WaitingViewController: UIViewController {

    @IBOutlet private weak var hiddenLabel: UILabel!

    @IBOutlet private weak var loadingLabel: UILabel!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
            self.hiddenLabel.isHidden = false
            self.loadingLabel.text    = "loaded"
        }
    }

    static func fromNib() -> WaitingViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "WaitingView") as! WaitingViewController

        return viewController
    }
}
