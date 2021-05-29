//
//  BlueViewController.swift
//  TestSegues
//
//  Created by Rudolf Farkas on 28.04.20.
//  Copyright © 2020 Rudolf Farkas. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    private lazy var unwindToRedButton = UIButton.actionButton(title: "unwind to Red", action: { [weak self] in
        self?.printClassAndFunc()
        self?.performSegue(withIdentifier: "unwindToRedVC", sender: self)
    })

    func layoutSubviews() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            unwindToRedButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            unwindToRedButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printClassAndFunc(info: "@")

        view.addSubview(unwindToRedButton)
        layoutSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printClassAndFunc(info: "@")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printClassAndFunc(info: "@")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printClassAndFunc(info: "@")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printClassAndFunc(info: "@")
    }

    deinit {
        printClassAndFunc(info: "@")
    }
}

extension BlueViewController {
    @IBAction func unwindToNowhere(_: UIStoryboardSegue) {
        printClassAndFunc()
    }
}
