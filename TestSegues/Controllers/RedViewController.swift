//
//  RedViewController.swift
//  TestSegues
//
//  Created by Rudolf Farkas on 28.04.20.
//  Copyright © 2020 Rudolf Farkas. All rights reserved.
//

import UIKit
import RudifaUtilPkg

class RedViewController: UIViewController {
    private lazy var toGreenButton = UIButton.actionButton(title: "segue to Green", action: { [weak self] in
        self?.printClassAndFunc()
        self?.performSegue(withIdentifier: "segueToGreenVC", sender: self)
    })

    func layoutSubviews() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            toGreenButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            toGreenButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printClassAndFunc("@")

        view.addSubview(toGreenButton)
        layoutSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printClassAndFunc("@")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printClassAndFunc("@")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printClassAndFunc("@")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printClassAndFunc("@")
    }

    deinit {
        printClassAndFunc("@")
    }
}

extension RedViewController {
    @IBAction func unwindToRedVC(_: UIStoryboardSegue) {
        printClassAndFunc()
    }
}
