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

extension Observable {
  public func toVoid() -> Observable<Void> {
    return map(void)
  }
}
