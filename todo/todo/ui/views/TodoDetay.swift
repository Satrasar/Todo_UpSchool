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

    override func viewDidLoad() {
        super.viewDidLoad()
        if let y = yapilacaklar {
            todoMesajDetay.text = y.todo_mesaj
        }

    }
    
    @IBAction func TodoGuncelle(_ sender: Any) {

        if let tm = todoMesajDetay.text, let y = yapilacaklar {
            guncelle(todo_id: y.todo_id!, todo_mesaj: tm)


        }

    }

    //once 14. 18. ve 19. satirlari yazdik. simdi guncelle fonksiyonunu yaziyoruz daha sonra todoGuncelle fonksiyon icini dolduruyoruz

    func guncelle (todo_id:Int, todo_mesaj: String){

        print("update todo: \(todo_id) - \(todo_mesaj)")


    }

}
