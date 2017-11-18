//
//  Rx+Extensions.swift
//  NFRxSwiftExt
//
//  Created by Tomoya Hirano on 2017/11/19.
//

import RxSwift

extension ObservableType {
  public typealias PreviousPair = (previous: Self.E?, current: Self.E)
  public func scanPrevious() -> Observable<PreviousPair> {
    return scanCurrentAndPrevious().map({ PreviousPair(previous: $0.first, current: $0.last!) })
  }
  
  private func scanCurrentAndPrevious() -> Observable<ArraySlice<Self.E>> {
    return scan([]) { (previous, current) in
      return Array(previous + [current]).suffix(2)
    }
  }
}
