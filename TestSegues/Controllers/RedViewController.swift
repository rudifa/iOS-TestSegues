//
//  RedViewController.swift
//  TestSegues
//
//  Created by Rudolf Farkas on 28.04.20.
//  Copyright © 2020 Rudolf Farkas. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    private lazy var toGreenButton = UIButton.actionButton(title: "segue to Green", action: toGreenButtonTap)

    @objc func toGreenButtonTap(sender: UIButton?) {
        printClassAndFunc()
        performSegue(withIdentifier: "segueToGreenVC", sender: self)
    }

    func layoutSubviews() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            toGreenButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            toGreenButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printClassAndFunc()

        view.addSubview(toGreenButton)
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

extension RedViewController {
    @IBAction func unwindToRedVC(_: UIStoryboardSegue) {
        printClassAndFunc()
    }
}
