//
//  Score.swift
//  BullsEye
//
//  Created by lalonso on 05/04/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

struct Score: Codable {
  let name: String?
  let score: Int?

  private enum CodingKeys: String, CodingKey {
    case name
    case score
  }
}
