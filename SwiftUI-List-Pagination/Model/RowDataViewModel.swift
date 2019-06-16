//
//  RowDataViewModel.swift
//  SwiftUI-List-Pagination
//
//  Created by MataraiKaoru on 2019/06/16.
//  Copyright © 2019 MataraiKaoru. All rights reserved.
//

import SwiftUI
import Combine

final class RowDataViewModel: BindableObject {

    var didChange = PassthroughSubject<RowDataViewModel, Never>()

    private(set) var rowDataModels = [RowData]() {
        didSet {
            didChange.send(self)
        }
    }

    func fetch(page: Int, count: Int) {

        fetchData(page: page, count: count)
            .map { $0 }
            .replaceError(with: [])
            .receive(subscriber: Subscribers.Sink<AnyPublisher<[RowData], Never>> { [weak self] fetchedDataModels in

                guard var models = self?.rowDataModels else { return }
                models.append(contentsOf: fetchedDataModels)
                self?.appendEndlInfo(to: models)
            })
    }

    func appendEndlInfo(to models: [RowData]) {

        var tmpModels = models.map {
            RowData(id: $0.id)
        }

        guard var lastModel = tmpModels.last else {
            return
        }

        lastModel.isEndIndex = true
        tmpModels[models.count - 1] = lastModel

        self.rowDataModels = tmpModels
    }
}
