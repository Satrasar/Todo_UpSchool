//
//  TodoKayit.swift
//  todo
//
//  Created by ozlemkumtas on 1.08.2023.
//

import UIKit

class TodoKayit: UIViewController {

    @IBOutlet weak var tfTodo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kayitTodo(_ sender: Any) {

        if let td = tfTodo.text {
            kaydet(whats_up: td)

        }
    }
//once fonksiyonu yazdim. 
    func kaydet (whats_up :  String){
        print("todo kaydet : \(whats_up)")
    }
}

