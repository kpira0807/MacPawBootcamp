import Foundation
import UIKit
import SnapKit

final class DaysCell: UITableViewCell {
    
    static let identifier = "DaysCell"
    
    private let backView = UIView()
    private let titleNumberDaysLabel = UILabel()
    private let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ viewModel: DaysCellViewModel) {
        titleNumberDaysLabel.text = "Day \(viewModel.day)"
        dateLabel.text = viewModel.date
    }
    
}

extension DaysCell {
    
    private func setupView() {
        addSubview(backView)
        backView.accessibilityIdentifier = "backView"
        backView.layer.cornerRadius = 8.0
        backView.layer.borderWidth = 1.5
        backView.layer.borderColor = Asset.borderColor.color.cgColor
        backView.backgroundColor = Asset.backgroundColor.color
        backView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(8.0)
            make.bottom.equalToSuperview().inset(8.0)
            make.leading.equalToSuperview().offset(8.0)
            make.trailing.equalToSuperview().inset(8.0)
        }
        
        backView.addSubview(titleNumberDaysLabel)
        titleNumberDaysLabel.accessibilityIdentifier = "titleNumberDaysLabel"
        titleNumberDaysLabel.numberOfLines = 1
        titleNumberDaysLabel.textAlignment = .left
        titleNumberDaysLabel.textColor = Asset.textTitleColor.color
        titleNumberDaysLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleNumberDaysLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(12.0)
            make.leading.equalToSuperview().offset(12.0)
            make.bottom.equalToSuperview().inset(12.0)
        }
        
        backView.addSubview(dateLabel)
        dateLabel.accessibilityIdentifier = "dateLabel"
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .right
        dateLabel.textColor = Asset.textTitleColor.color.withAlphaComponent(0.8)
        dateLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        dateLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(12.0)
            make.leading.equalTo(titleNumberDaysLabel.snp.trailing).offset(12.0)
            make.bottom.equalToSuperview().inset(12.0)
            make.trailing.equalToSuperview().inset(12.0)
        }
    }
    
}
