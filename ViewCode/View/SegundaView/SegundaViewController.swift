//
//  SegundaViewController.swift
//  ViewCode
//
//  Created by COTEMIG on 04/09/23.
//
import Alamofire
import UIKit

class SegundaViewController: UIViewController {
    
    private lazy var image : UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel : UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var detailLabel : UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Habilidades:"
        view.font = UIFont(name: "Menlo", size: 20)
        return view
    }()
    
    private lazy var table : UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    var imagem : String = ""
    var name : String = ""
    var link : String = ""
    var listaAtaques : [Ability] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(image)
        view.addSubview(nameLabel)
        view.addSubview(table)
        view.addSubview(detailLabel)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            image.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 180),
            image.widthAnchor.constraint(equalToConstant: 180),
            nameLabel.topAnchor.constraint(equalTo: image.layoutMarginsGuide.bottomAnchor, constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            detailLabel.topAnchor.constraint(equalTo: nameLabel.layoutMarginsGuide.bottomAnchor, constant: 30),
            detailLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            detailLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            table.topAnchor.constraint(equalTo: detailLabel.layoutMarginsGuide.bottomAnchor, constant: 30),
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
            
        ])
        carregarLista()
        carregarImagem()
        nameLabel.text = name.capitalized
        nameLabel.textAlignment = .center
        detailLabel.textAlignment = .center
        
        
        table.dataSource = self
        table.register(MyDetailCell.self, forCellReuseIdentifier: "DefaultCell")
        
        
    }
    
    private func carregarLista(){
        AF.request(link).responseDecodable(of:Abilities.self){
            response in
            if let ability = response.value {
                self.listaAtaques = ability.abilities
                self.table.reloadData()
            }
        }
    }
    
    private func carregarImagem() {
        image.kf.setImage(with: URL(string: imagem))
    }

}

extension SegundaViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAtaques.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = listaAtaques[indexPath.row]
        if let cell = table.dequeueReusableCell(withIdentifier: "DefaultCell") as? MyDetailCell {
            cell.textLabel?.text = item.ability.name
            return cell
        }
        return UITableViewCell()
    }
    
    
}
