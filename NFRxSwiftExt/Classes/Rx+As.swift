//
//  Rx+As.swift
//  NFRxSwiftExt
//
//  Created by Tomoya Hirano on 2017/11/19.
//

import RxSwift
import RxCocoa
import RxOptional

extension PublishSubject where Element == Void {
  public func asDriver() -> Driver<Element> {
    return asDriver(onErrorJustReturn: ())
  }
}

extension PublishSubject where E: OptionalType {
  public func asDriver() -> Driver<E.Wrapped> {
    return map({ $0.value }).asDriver(onErrorJustReturn: nil).filterNil()
  }
}

extension PublishSubject where E: OptionalType {
  public func asDriver() -> Driver<E.Wrapped?> {
    return map({ $0.value }).asDriver(onErrorJustReturn: nil)
  }
}

extension PublishSubject where Element == Collection {
  public func asDriver() -> Driver<E> {
    return asDriver(onErrorJustReturn: [])
  }
}

extension Variable {
  public func asProperty() -> Property<E> {
    return Property(self)
  }
}

extension ObservableType {
  public func asDriverOnErrorDriveWithEmpty() -> SharedSequence<DriverSharingStrategy, Self.E> {
    return asDriver(onErrorDriveWith: Driver.empty())
  }
}
