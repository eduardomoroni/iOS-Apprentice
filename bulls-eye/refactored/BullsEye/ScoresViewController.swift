//
//  ScoresViewController.swift
//  BullsEye
//
//  Created by lalonso on 05/04/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController {

  @IBOutlet weak var highScoresTableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
  var scores: [Score] = [] {
    didSet {
      DispatchQueue.main.async {
        self.highScoresTableView.reloadData()
      }
    }
  }

  let defaultSession = URLSession(configuration: .default)
  var dataTask: URLSessionDataTask?

  override func viewDidLoad() {
    highScoresTableView.dataSource = self
    highScoresTableView.allowsSelection = false
  }

  override func viewWillAppear(_ animated: Bool) {
    dataTask?.cancel()

    let url = URL(string: "https://us-central1-capdev-score-api.cloudfunctions.net/api/scores/")
    dataTask = defaultSession.dataTask(with: url!) { [weak self] data, response, error in
      if let data = data {
        self?.parse(jsonData: data)
      }
      self?.finishLoading()
    }

    dataTask?.resume()
  }

  private func parse(jsonData data: Data) {
    do {
      let decoder = JSONDecoder()
      let scores = try decoder.decode([Score].self, from: data)
      self.scores = scores
    } catch {
      print(error.localizedDescription)
    }
  }

  private func finishLoading() {
    DispatchQueue.main.async {
      self.activityIndicator.isHidden = true
      self.highScoresTableView.isHidden = false
    }
  }

  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
}

extension ScoresViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return scores.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(
            withIdentifier: "ScoreCell",
            for: indexPath) as? ScoreCell {
      cell.personLabel.text = scores[indexPath.row].name
      cell.scoreLabel.text = String(scores[indexPath.row].score!)
      return cell
    }
    return UITableViewCell()
  }
}
