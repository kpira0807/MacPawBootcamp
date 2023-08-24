import Foundation
import UIKit
import SnapKit
import Combine

final class DaysControllerView: NiblessViewController {
    
    var filteredDays: [DaysCellViewModel] = []
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DaysCell.self, forCellReuseIdentifier: DaysCell.identifier)
        return tableView
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.placeholder = "Search day..."
        searchController.searchBar.searchBarStyle = .minimal
        searchController.definesPresentationContext = true
        
        return searchController
    }()
    
    private let viewModel: DaysViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    init(viewModel: DaysViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Asset.textColor.color]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: Asset.textColor.color, .font: UIFont.boldSystemFont(ofSize: 24.0)]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = L10n.Days.Title.name
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        view.backgroundColor = .white
        setupBindings()
        setupViews()
    }
    
    private func setupBindings() {
        viewModel.reloadDaysData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.setupViews()
                self?.tableView.reloadData()
            }.store(in: &subscriptions)
    }
    
}

extension DaysControllerView {
    
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
        let days = viewModel.cellViewModels
        filteredDays = days.filter({(day: DaysCellViewModel) -> Bool in
            return day.day.contains(searchText)
        })
        tableView.reloadData()
    }
    
}

extension DaysControllerView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredDays.count
        }
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var viewModels: DaysCellViewModel
        if isFiltering {
            viewModels = filteredDays[indexPath.row]
        } else {
            viewModels = viewModel.cellViewModels[indexPath.row]
        }
        
        let cell: DaysCell = tableView.dequeueReusableCell(withIdentifier: DaysCell.identifier, for: indexPath) as! DaysCell
        cell.setup(viewModels)
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension DaysControllerView: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        print("performDropWith")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModels: DaysCellViewModel
        if isFiltering {
            viewModels = filteredDays[indexPath.row]
            viewModels.onSelect()
        } else {
            viewModels = viewModel.cellViewModels[indexPath.row]
            viewModels.onSelect()
        }
    }
}

extension DaysControllerView: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        [UIDragItem(itemProvider: NSItemProvider())]
    }
    
}

extension DaysControllerView: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
}
