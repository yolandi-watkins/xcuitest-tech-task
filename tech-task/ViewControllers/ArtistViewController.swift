//
//  ArtistViewController.swift
//  tech-task
//
//  Created by Leighroy on 28/10/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    static func fromNib(artistName: String) -> ArtistViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ArtistView") as! ArtistViewController

        viewController.loadViewIfNeeded()
        viewController.label.text = "Artist page for \(artistName)"
        return viewController
    }
}
