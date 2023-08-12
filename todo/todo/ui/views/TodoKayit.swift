//
//  TodoKayit.swift
//  todo
//
//  Created by ozlemkumtas on 1.08.2023.
//

import UIKit

class TodoKayit: UIViewController {

    @IBOutlet weak var tfTodo: UITextField!

    var viewModel = TodoKayitViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kayitTodo(_ sender: Any) {

        if let td = tfTodo.text {
            viewModel.kaydet(whats_up: td)

        }
    }

}

