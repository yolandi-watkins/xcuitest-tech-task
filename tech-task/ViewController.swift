//
//  ViewController.swift
//  tech-task
//
//  Created by Leighroy on 28/10/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var artistNames: [String] = {
        return ["Adele", "Beyonce", "Cardi B", "Dolly Parson", "Ellie Goulding", "Frank Sinatra",
                "G Unit", "Hanson Twins", "I Prevail", "Jimi Hendrix"].shuffled()
    }()
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.label.text = artistNames[indexPath.row]

        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artistName = artistNames[indexPath.row]

        switch artistName {
        case "Beyonce":
            navigationController?.pushViewController(WaitingViewController.fromNib(), animated: true)
        case "Frank Sinatra":
            navigationController?.pushViewController(LocationViewController.fromNib(), animated: true)
        default:
            navigationController?.pushViewController(ArtistViewController.fromNib(artistName: artistName), animated: true)
        }
    }
}

