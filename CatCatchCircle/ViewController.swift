//
//  ViewController.swift
//  CatCatchCircle
//
//  Created by Konstantyn Koroban on 03/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func loadView() {
        super.loadView()
        configureView()
    }
    
    private func configureView() {
        addToyView()
        view.backgroundColor = .black
        
    }
    
    private func addToyView() {
        let toyView = makeToyView()
        view.addSubview(toyView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(play))
        toyView.addGestureRecognizer(tapGesture)
    }
    
    private func makeToyView() -> UIView {
        let toyView = UIView()
        setRandomRadius(for: toyView)
        toyView.center = view.center
        toyView.backgroundColor = .orange
        return toyView
    }
    
    private func makeRandomSize() -> CGSize {
        let randomDiameter = CGFloat.random(in: 40...80)
        let randomSize = CGSize(width: randomDiameter, height: randomDiameter)
        return randomSize
        
    }
    
    private func setRandomRadius(for view: UIView) {
        let randomSize = makeRandomSize()
        view.bounds.size = randomSize
        view.layer.cornerRadius = randomSize.width/2
        
    }
    
    private func makeRandomPosition(for size: CGSize) -> CGPoint{
        .init(x: .random(in: 0...(view.bounds.width - size.width)), y: .random(in: 0...(view.bounds.height - size.height)))
    }
    
    private func setRandomPosition(for view: UIView) {
        view.frame.origin = makeRandomPosition(for: view.frame.size)
    }
    
    
    private func makeRandomColor() -> UIColor {
        .init(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
    
    private func setRandomColor(for view: UIView) {
        view.backgroundColor = makeRandomColor()
        
    }
    
    @objc
    private func play(_ recognizer: UITapGestureRecognizer ) {
        guard let toyView = recognizer.view else { return }
        setRandomRadius(for: toyView)
        setRandomPosition(for: toyView)
        setRandomColor(for: toyView)
        
    }
    
}
