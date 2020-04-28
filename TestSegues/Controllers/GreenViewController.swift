//
//  GreenViewController.swift
//  TestSegues
//
//  Created by Rudolf Farkas on 28.04.20.
//  Copyright © 2020 Rudolf Farkas. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    private lazy var toBlueButton = UIButton.actionButton(title: "segue to Blue", action: toBlueButtonTap)

    @objc func toBlueButtonTap(sender: UIButton?) {
        printClassAndFunc()
        performSegue(withIdentifier: "segueToBlueVC", sender: self)
    }

    func layoutSubviews() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            toBlueButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            toBlueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printClassAndFunc()

        view.addSubview(toBlueButton)
        layoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printClassAndFunc()
    }

    deinit {
        printClassAndFunc()
    }
}

extension GreenViewController {
    @IBAction func unwindToGreenVC(_: UIStoryboardSegue) {
        printClassAndFunc()
    }
}
