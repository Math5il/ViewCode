//
//  ViewController.swift
//  ViewCode
//
//  Created by COTEMIG on 30/08/23.
//
import Alamofire
import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var indice = 0
    var lista: [Pokemon] = []
    var listaImagem: [ImagePokemon] = []
    
    private lazy var testeLabel : UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Matheus Santos"
        view.textAlignment = .center
        view.font = UIFont(name: "Menlo", size: 15)
        return view
    }()
    
    private lazy var table : UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        carregarLista()
        print(listaImagem)
        
        table.dataSource = self
        table.delegate = self
        
        
        view.addSubview(testeLabel)
        view.addSubview(table)
        
        
        NSLayoutConstraint.activate([
            testeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            testeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            testeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            table.topAnchor.constraint(equalTo: self.testeLabel.topAnchor, constant: 30),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        table.register(MyCell.self, forCellReuseIdentifier: "DefaultCell")
        
    }
    
    private func carregarLista() {
        AF.request("https://pokeapi.co/api/v2/pokemon?offset=0&limit=1010").responseDecodable(of:Resultados.self){
            response in
            if let pokemon = response.value {
                self.lista = pokemon.results
                self.table.reloadData()
                
            }
            
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = lista[indexPath.row]
        
        if let cell = table.dequeueReusableCell(withIdentifier: "DefaultCell") as? MyCell{
            cell.textLabel?.text = item.name.capitalized
            
            AF.request("https://pokeapi.co/api/v2/pokemon-form/\(indexPath.row + 1)/").responseDecodable(of:ResultadoImage.self){
                response in
                if let imagem = response.value {
                    cell.addImagem(imagem.sprites.frontDefault)
                    self.listaImagem.append(imagem.sprites)
                }
            }
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tela2 = SegundaViewController()
        tela2.imagem = listaImagem[indexPath.row].frontDefault
        tela2.name = lista[indexPath.row].name
        tela2.link = lista[indexPath.row].url
        navigationController?.pushViewController(tela2, animated: true)
    }
    
    
}
