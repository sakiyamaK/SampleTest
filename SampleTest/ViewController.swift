//
//  ViewController.swift
//  SampleTest
//
//  Created by sakiyamaK on 2020/09/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  private let mainStackView: UIStackView = .init()

  private let counterLabel: UILabel = .init()

  private let buttonsStackView: UIStackView = .init()
  private let incrementButton: UIButton = .init()
  private let decrementButton: UIButton = .init()

  private var counter: Counter = .init()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureViews()
    self.configureButtonTargets()
    self.update()
  }
}

private extension ViewController {

  func configureViews() {
    view.addSubview(mainStackView)
    mainStackView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
      $0.left.equalToSuperview().offset(16)
      $0.right.equalToSuperview().offset(-16)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
    }

    mainStackView.axis = .vertical
    mainStackView.alignment = .fill
    mainStackView.distribution = .fillEqually

    mainStackView.addArrangedSubview(counterLabel)
    counterLabel.textAlignment = .center
    counterLabel.font = UIFont.systemFont(ofSize: 40)
    counterLabel.snp.makeConstraints { $0.height.equalToSuperview().multipliedBy(0.5) }

    mainStackView.addArrangedSubview(buttonsStackView)

    buttonsStackView.addArrangedSubview(decrementButton)
    buttonsStackView.addArrangedSubview(incrementButton)
    buttonsStackView.axis = .horizontal
    buttonsStackView.alignment = .fill
    buttonsStackView.distribution = .fillEqually
    buttonsStackView.spacing = 10

    incrementButton.setTitle("increment", for: .normal)
    incrementButton.setTitleColor(.black, for: .normal)
    incrementButton.backgroundColor = .systemPink

    decrementButton.setTitle("decrement", for: .normal)
    decrementButton.setTitleColor(.black, for: .normal)
    decrementButton.backgroundColor = .systemBlue
  }

  func configureButtonTargets() {
    incrementButton.addTarget(self, action: #selector(tapIncrement(_:)), for: .touchUpInside)
    decrementButton.addTarget(self, action: #selector(tapDecrement(_:)), for: .touchUpInside)
  }

  func configure() {
    update()
  }

  func update() {
    counterLabel.text = counter.count.description
    decrementButton.isEnabled = !counter.isLowerLimit
    incrementButton.isEnabled = !counter.isUpperLimit
  }

  @objc func tapIncrement(_ sender: UIButton) {
    print("tap")
    counter.increment()
    update()
  }

  @objc func tapDecrement(_ sender: UIButton) {
    print("tap")
    counter.decrement()
    update()
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewController_Wrapper: UIViewControllerRepresentable {

  // 初期化メソッド
  func makeUIViewController(context: Context) -> ViewController {
    let vc = ViewController()
    return vc
  }

  // SwiftUI側から更新がかかったときに呼ばれるメソッド
  func updateUIViewController(_ vc: ViewController, context: Context) {
    // 更新用のメソッド
  }
}

struct ViewController_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ViewController_Wrapper()
    }
  }
}

#endif

