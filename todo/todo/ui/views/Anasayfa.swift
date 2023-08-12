//
//  ViewController.swift
//  todo
//
//  Created by ozlemkumtas on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var todoTableView: UITableView!

    var todoListesi = [Todo]() //Todo.swift icerisinde tanimladigimiz class adi "Todo"

    var viewModel = AnasayfaViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self //yetkilendirme
        todoTableView.dataSource = self //self dememizin sebebi anasayfa
        todoTableView.delegate = self

        _ = viewModel.todoListesi.subscribe(onNext: { liste in
            self.todoListesi = liste
            self.todoTableView.reloadData()

        })

    }

    override func viewWillAppear(_ animated: Bool) { //sayfa her gorundugu an
        viewModel.TodoYukle()
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {


            if let yapilacaklarx = sender as? Todo {
                let gidilecekVC = segue.destination as! TodoDetay //downcasting yaptik
                gidilecekVC.yapilacaklar = yapilacaklarx // sagdaki yapilacaklar bu sayfadan aldigimiz soldaki ise TodoDetay sayfasindan aldigimiz yapilacaklar
            }
        }
    }


}

extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }

}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
//kac tane veri gosterecegini bilmek ister
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListesi.count
    }
//dongu gibi calisacak
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todoListesi[indexPath.row] //sirayla todo listesine erisecegiz

        let hucre = tableView.dequeueReusableCell(withIdentifier: "todoHucre") as! TodoHucre
        hucre.labelTodoMesaj.text = todo.name
        return hucre
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true) //secim kaldirma
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let silAction = UIContextualAction(style: .destructive, title: "Delete") {_,_,_ in
        let todo = self.todoListesi[indexPath.row]

            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(iptalAction)

            let evetAction = UIAlertAction(title: "Yes", style: .destructive) { action in
                self.viewModel.sil(id :todo.id!)
            }
            alert.addAction(evetAction)

            self.present(alert, animated: true) //goruntuleme kismi
        }
        return UISwipeActionsConfiguration(actions: [silAction]) // "s" takisi var ise muhtemelen arraydir
    }


}
