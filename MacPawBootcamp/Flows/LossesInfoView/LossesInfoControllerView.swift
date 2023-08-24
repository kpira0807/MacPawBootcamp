import Foundation
import UIKit
import SnapKit
import Combine

final class LossesInfoControllerView: NiblessViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LossesDetailCell.self, forCellReuseIdentifier: LossesDetailCell.identifier)
        
        return tableView
    }()
    
    private let viewModel: LossesInfoViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    init(viewModel: LossesInfoViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = Asset.textColor.color
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Asset.textColor.color]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: Asset.textColor.color, .font: UIFont.boldSystemFont(ofSize: 20.0)]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = viewModel.dayNumber
        
        view.backgroundColor = .white
        
        backButtonStyle()
        setupBindings()
        setupViews()
    }
    
    private func backButtonStyle() {
        let backButton = UIBarButtonItem()
        backButton.title = L10n.Days.title
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupBindings() {
        viewModel.reloadDayInfoData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.setupViews()
                self?.tableView.reloadData()
            }.store(in: &subscriptions)
    }
    
}

extension LossesInfoControllerView {
    
    private func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.accessibilityIdentifier = "tableView"
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension LossesInfoControllerView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LossesDetailCell = tableView.dequeueReusableCell(withIdentifier: LossesDetailCell.identifier, for: indexPath) as! LossesDetailCell
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        cell.setup(cellViewModel)
        cell.selectionStyle = .none
        
        return cell
    }
    
}
