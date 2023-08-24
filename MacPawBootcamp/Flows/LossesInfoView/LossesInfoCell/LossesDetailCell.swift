import Foundation
import UIKit
import SnapKit

final class LossesDetailCell: UITableViewCell {
    
    static let identifier = "LossesDetailCell"
    
    private let backView = UIView()
    private let lossesNameLabel = UILabel()
    private let lossesFullNumberLabel = UILabel()
    private let lossesDayNumberLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ viewModel: LossesInfoCellViewModel) {
        lossesNameLabel.text = viewModel.name
        lossesFullNumberLabel.text = viewModel.fullNumber
        lossesDayNumberLabel.text = viewModel.dayNumber
    }
    
}

extension LossesDetailCell {
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(backView)
        backView.accessibilityIdentifier = "backView"
        backView.layer.cornerRadius = 8.0
        backView.layer.borderWidth = 1.0
        backView.layer.borderColor = Asset.borderColor.color.cgColor
        backView.backgroundColor = Asset.backgroundColor.color
        backView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(4.0)
            make.bottom.equalToSuperview().inset(4.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().inset(16.0)
        }
        
        backView.addSubview(lossesNameLabel)
        lossesNameLabel.accessibilityIdentifier = "lossesNameLabel"
        lossesNameLabel.numberOfLines = 0
        lossesNameLabel.textAlignment = .left
        lossesNameLabel.textColor = Asset.textColor.color
        lossesNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        lossesNameLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(8.0)
            make.leading.equalToSuperview().offset(8.0)
            make.trailing.equalTo(backView.snp.centerX)
            make.bottom.equalToSuperview().inset(8.0)
        }
        
        backView.addSubview(lossesDayNumberLabel)
        lossesDayNumberLabel.accessibilityIdentifier = "lossesDayNumberLabel"
        lossesDayNumberLabel.numberOfLines = 1
        lossesDayNumberLabel.textAlignment = .left
        lossesDayNumberLabel.textColor = Asset.textColor.color
        lossesDayNumberLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        lossesDayNumberLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(8.0)
            make.trailing.equalToSuperview().inset(4.0)
            make.bottom.equalToSuperview().inset(8.0)
            make.width.equalTo(70.0)
        }
        
        backView.addSubview(lossesFullNumberLabel)
        lossesFullNumberLabel.accessibilityIdentifier = "lossesFullNumberLabel"
        lossesFullNumberLabel.numberOfLines = 1
        lossesFullNumberLabel.textAlignment = .left
        lossesFullNumberLabel.textColor = Asset.textColor.color
        lossesFullNumberLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        lossesFullNumberLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(8.0)
            make.leading.equalTo(backView.snp.centerX).offset(16.0)
            make.bottom.equalToSuperview().inset(8.0)
            make.trailing.equalTo(lossesDayNumberLabel.snp.leading).offset(8.0)
        }
        
    }
    
}
