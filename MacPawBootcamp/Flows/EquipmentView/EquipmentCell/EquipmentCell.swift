import Foundation
import UIKit
import SnapKit

final class EquipmentCell: UITableViewCell {
    
    static let identifier = "EquipmentCell"
    
    private let backView = UIView()
    private let imageEquipment = UIImageView()
    private let nameEquipmentLabel = UILabel()
    private let modelEquipmentLabel = UILabel()
    private let manufacturaEquipmentLabel = UILabel()
    private let totalLossesEquipmentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ viewModel: EquipmentCellViewModel) {
        imageEquipment.image = viewModel.image
        nameEquipmentLabel.text = "Equipment: \(viewModel.equipmentOryx)"
        modelEquipmentLabel.text = "Model: \(viewModel.model)"
        manufacturaEquipmentLabel.text = "Manufactura: \(viewModel.manufacturer)"
        totalLossesEquipmentLabel.text = "TOTAL: \(viewModel.lossesTotal)"
    }
    
}

extension EquipmentCell {
    
    private func setupView() {
        addSubview(backView)
        backView.accessibilityIdentifier = "backView"
        backView.layer.cornerRadius = 8.0
        backView.layer.borderWidth = 1.5
        backView.layer.borderColor = Asset.borderColor.color.cgColor
        backView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(8.0)
            make.bottom.equalToSuperview().inset(8.0)
            make.leading.equalToSuperview().offset(8.0)
            make.trailing.equalToSuperview().inset(8.0)
        }
        
        backView.addSubview(imageEquipment)
        imageEquipment.accessibilityIdentifier = "imageEquipment"
        imageEquipment.contentMode = .scaleToFill
        imageEquipment.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(150.0)
        }
        
        backView.addSubview(nameEquipmentLabel)
        nameEquipmentLabel.accessibilityIdentifier = "nameEquipmentLabel"
        nameEquipmentLabel.numberOfLines = 0
        nameEquipmentLabel.textAlignment = .left
        nameEquipmentLabel.textColor = Asset.textTitleColor.color
        nameEquipmentLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        nameEquipmentLabel.snp.makeConstraints{make in
            make.top.equalTo(imageEquipment.snp.bottom).offset(12.0)
            make.leading.equalToSuperview().offset(12.0)
            make.trailing.equalToSuperview().inset(12.0)
        }
        
        backView.addSubview(modelEquipmentLabel)
        modelEquipmentLabel.accessibilityIdentifier = "modelEquipmentLabel"
        modelEquipmentLabel.numberOfLines = 0
        modelEquipmentLabel.textAlignment = .left
        modelEquipmentLabel.textColor = Asset.textTitleColor.color
        modelEquipmentLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        modelEquipmentLabel.snp.makeConstraints{make in
            make.top.equalTo(nameEquipmentLabel.snp.bottom).offset(8.0)
            make.leading.equalToSuperview().offset(12.0)
            make.trailing.equalToSuperview().inset(12.0)
        }
        
        backView.addSubview(manufacturaEquipmentLabel)
        manufacturaEquipmentLabel.accessibilityIdentifier = "manufacturaEquipmentLabel"
        manufacturaEquipmentLabel.numberOfLines = 1
        manufacturaEquipmentLabel.textAlignment = .left
        manufacturaEquipmentLabel.textColor = Asset.textTitleColor.color
        manufacturaEquipmentLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        manufacturaEquipmentLabel.snp.makeConstraints{make in
            make.top.equalTo(modelEquipmentLabel.snp.bottom).offset(8.0)
            make.leading.equalToSuperview().offset(12.0)
            make.trailing.equalToSuperview().inset(12.0)
        }
        
        backView.addSubview(totalLossesEquipmentLabel)
        totalLossesEquipmentLabel.accessibilityIdentifier = "totalLossesEquipmentLabel"
        totalLossesEquipmentLabel.numberOfLines = 1
        totalLossesEquipmentLabel.textAlignment = .center
        totalLossesEquipmentLabel.textColor = Asset.textTitleColor.color
        totalLossesEquipmentLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        totalLossesEquipmentLabel.snp.makeConstraints{make in
            make.top.equalTo(manufacturaEquipmentLabel.snp.bottom).offset(8.0)
            make.leading.equalToSuperview().offset(12.0)
            make.trailing.equalToSuperview().inset(12.0)
            make.bottom.equalToSuperview().inset(8.0)
        }
    }
    
}
