//
//  TodoDetay.swift
//  todo
//
//  Created by ozlemkumtas on 1.08.2023.
//

import UIKit

class TodoDetay: UIViewController {

    @IBOutlet weak var todoMesajDetay: UITextField!

    var yapilacaklar: Todo? //todo classindan Todo yu inherit yaptik

    var viewModel = TodoDetayViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let y = yapilacaklar {
            todoMesajDetay.text = y.name
        }

    }
    
    @IBAction func TodoGuncelle(_ sender: Any) {

        if let tm = todoMesajDetay.text, let y = yapilacaklar {
            viewModel.guncelle(id: y.id!, name: tm)


        }

    }

    //once 14. 18. ve 19. satirlari yazdik. simdi guncelle fonksiyonunu yaziyoruz daha sonra todoGuncelle fonksiyon icini dolduruyoruz


}
