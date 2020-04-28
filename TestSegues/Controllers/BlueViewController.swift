//
//  BlueViewController.swift
//  TestSegues
//
//  Created by Rudolf Farkas on 28.04.20.
//  Copyright © 2020 Rudolf Farkas. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    private lazy var unwindToRedButton = UIButton.actionButton(title: "unwind to Red", action: unwindToRedButtonTap)

    @objc func unwindToRedButtonTap(sender: UIButton?) {
        printClassAndFunc()
        performSegue(withIdentifier: "unwindToRedVC", sender: self)
    }

    func layoutSubviews() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            unwindToRedButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            unwindToRedButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printClassAndFunc()

        view.addSubview(unwindToRedButton)
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

extension BlueViewController {
    @IBAction func unwindToNowhere(_: UIStoryboardSegue) {
        printClassAndFunc()
    }
}
