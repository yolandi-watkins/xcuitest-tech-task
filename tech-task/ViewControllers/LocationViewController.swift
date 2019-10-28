//
//  LocationViewController.swift
//  tech-task
//
//  Created by Leighroy on 28/10/2019.
//  Copyright © 2019 DICE FM. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    private var locationManager: CLLocationManager?

    static func fromNib() -> LocationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "LocationView") as! LocationViewController

        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }

    @IBAction func buttonTapped() {
        locationManager?.requestAlwaysAuthorization()
    }
}

extension LocationViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            label.text = "Authorized"
        case .denied, .restricted:
            label.text = "Denied"
        case .notDetermined:
            label.text = "Not determined"
        @unknown default:
            label.text = "Unknown"
        }
    }
}
