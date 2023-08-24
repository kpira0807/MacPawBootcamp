import Foundation
import UIKit
import SnapKit
import Combine

final class EquipmentViewController: NiblessViewController {
    
    var filteredEquipments: [EquipmentCellViewModel] = []
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EquipmentCell.self, forCellReuseIdentifier: EquipmentCell.identifier)
        
        return tableView
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.placeholder = "Search equipment..."
        searchController.searchBar.searchBarStyle = .minimal
        searchController.definesPresentationContext = true
        
        return searchController
    }()
    
    private let viewModel: EquipmentViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    init(viewModel: EquipmentViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Asset.textColor.color]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: Asset.textColor.color, .font: UIFont.boldSystemFont(ofSize: 24.0)]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = L10n.LossesEquipment.title
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        view.backgroundColor = .white
        setupBindings()
        setupViews()
    }
    
    
    private func setupBindings() {
        viewModel.reloadEquipmentData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.setupViews()
                self?.tableView.reloadData()
            }.store(in: &subscriptions)
    }
    
}

extension EquipmentViewController {
    
    private func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        tableView.accessibilityIdentifier = "tableView"
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        let info = viewModel.cellViewModels
        filteredEquipments = info.filter({(equipmentInfo: EquipmentCellViewModel) -> Bool in
            return equipmentInfo.equipmentOryx.contains(searchText)
            || equipmentInfo.model.contains(searchText)
            || equipmentInfo.manufacturer.contains(searchText)
        })
        tableView.reloadData()
    }
    
}

extension EquipmentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredEquipments.count
        }
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var viewModels: EquipmentCellViewModel
        if isFiltering {
            viewModels = filteredEquipments[indexPath.row]
        } else {
            viewModels = viewModel.cellViewModels[indexPath.row]
        }
        
        let cell: EquipmentCell = tableView.dequeueReusableCell(withIdentifier: EquipmentCell.identifier, for: indexPath) as! EquipmentCell
        cell.setup(viewModels)
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension EquipmentViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
}
