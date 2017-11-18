//
//  Rx+void.swift
//  kinkakuji-ios
//
//  Created by Tomoya Hirano on 2017/10/11.
//  Copyright © 2017年 Daiki Shimizu. All rights reserved.
//

import RxSwift
import RxCocoa
import RxOptional

public func void<T>(_: T) -> Void {
  return Void()
}

extension ObservableType {
  public func toVoid() -> Observable<Void> {
    return map(void)
  }
}

extension ObservableType where E : Equatable {
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
