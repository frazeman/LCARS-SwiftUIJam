//
//  NumbersGrid.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-05.
//

import SwiftUI
import Combine

struct GridData: Equatable {
    let columns: [Column]

    struct Column: Identifiable, Equatable {
        let id: UUID
        let items: [Item]

        init(id: UUID = UUID(), items: [Item]) {
            self.id = id
            self.items = items
        }
    }

    struct Item: Identifiable, Equatable {
        let id: UUID
        let value: String
        let highlight: Bool
        let hidden: Bool

        init(id: UUID = UUID(), value: String, highlight: Bool = false, hidden: Bool = false) {
            self.id = id
            self.value = value
            self.highlight = highlight
            self.hidden = hidden
        }
    }

    init(columns: [Column]) {
        self.columns = columns
    }

    init(numbers: [[Int]]) {
        var columns = [Column]()

        for col in numbers {
            var items = [Item]()

            for value in col {
                items.append(Item(value: "\(value)"))
            }

            columns.append(Column(items: items))
        }

        self.init(columns: columns)
    }

    var rowCount: Int {
        columns.first?.items.count ?? 0
    }

    func unhighlightAll() -> GridData {
        highlight(rows: [])
    }

    func highlight(row: Int) -> GridData {
        highlight(rows: [row])
    }

    func highlight(rows: [Int]) -> GridData {
        var newColumns = [Column]()

        for col in columns {
            var newItems = [Item]()

            for (index, item) in col.items.enumerated() {
                newItems.append(Item(
                    id: item.id,
                    value: item.value,
                    highlight: rows.contains(index),
                    hidden: item.hidden
                ))
            }

            newColumns.append(Column(id: col.id, items: newItems))
        }

        return GridData(columns: newColumns)
    }

    func showAll() -> GridData {
        hide(rows: [])
    }

    func hideAll() -> GridData {
        hide(rows: Array(0..<rowCount))
    }

    func hide(row: Int) -> GridData {
        hide(rows: [row])
    }

    func hide(rows: [Int]) -> GridData {
        var newColumns = [Column]()

        for col in columns {
            var newItems = [Item]()

            for (index, item) in col.items.enumerated() {
                newItems.append(Item(
                    id: item.id,
                    value: item.value,
                    highlight: item.highlight,
                    hidden: rows.contains(index)
                ))
            }

            newColumns.append(Column(id: col.id, items: newItems))
        }

        return GridData(columns: newColumns)
    }

    static func generateNumberColumn(rows: Int, minChar: Int, maxChar: Int) -> Column {
        var items = [Item]()

        for _ in 0..<rows {
            let chars = Int.random(in: minChar...maxChar)

            let min = Int(pow(Double(10), Double(chars-1)))
            let max = Int(pow(Double(10), Double(chars))) - 1

            let number = Int.random(in: min...max)
            items.append(Item(value: "\(number)"))
        }

        return Column(items: items)
    }

    static func generateNumberGrid(cols: Int, rows: Int) -> GridData {
        var columns = [Column]()

        for _ in 0..<cols {
            let spread = Int.random(in: 1...4)
            let minWidth = Int.random(in: 1...7)

            columns.append(
                generateNumberColumn(rows: rows, minChar: minWidth, maxChar: minWidth + spread)
            )
        }

        return GridData(columns: columns)
    }

    static let testData = generateNumberGrid(cols: 6, rows: 5)
}

extension GridData {

    static func generateNumberGrid(width: CGFloat, height: CGFloat) -> GridData {
        let rowCount = Int(floor(height / GridView.estimatedRowHeight))
        var remainingWidth = width

        var columns = [Column]()

        while remainingWidth > 0 {
            let spread = Int.random(in: 1...4)
            let minChar = Int.random(in: 1...7)
            let maxChar = minChar + spread

            remainingWidth -= CGFloat(maxChar) * GridView.estimatedCharWidth + GridView.columnPadding
            if remainingWidth < 0 { break }

            columns.append(
                generateNumberColumn(rows: rowCount, minChar: minChar, maxChar: maxChar)
            )
        }

        return GridData(columns: columns)
    }

}

struct GridView: View {
    let data: GridData

    static let columnPadding: CGFloat = 20
    static let estimatedRowHeight: CGFloat = 30
    static let estimatedCharWidth: CGFloat = 7.25

    var body: some View {
        HStack(spacing: Self.columnPadding) {
            ForEach(data.columns) { column in
                VStack(alignment: .trailing, spacing: 5) {
                    ForEach(column.items) { item in
                        GridItem(item.value, highlight: item.highlight, hidden: item.hidden)
                    }
                }
            }
        }
    }

    struct GridItem: View {
        let value: String
        let highlight: Bool
        let hidden: Bool

        init(_ value: String, highlight: Bool = false, hidden: Bool = false) {
            self.value = value
            self.highlight = highlight
            self.hidden = hidden
        }

        var body: some View {
            Text(value)
                .font(Font.LCARS.data)
                .foregroundColor(.orange)
                .opacity(hidden ? 0 : 1)
                .overlay(
                    Text(value)
                        .font(Font.LCARS.data)
                        .foregroundColor(.white)
                        .opacity(highlight && !hidden ? 1 : 0)
                )
        }
    }
}

struct AnimatedGridView: View {
    var animationStyle: AnimationStyle = .header

    enum AnimationStyle {
        case header
        case fullscreen
    }

    @State var gridData: GridData = .testData
    @State private var targetSize: CGSize = .zero

    var body: some View {
        GeometryReader { proxy in
            GridView(data: gridData)
                .onAppear {
                    targetSize = proxy.size
                    self.animateGrid()
                }
                .onChange(of: proxy.size) { newSize in
                    targetSize = newSize
                }
        }
    }

    private func animateGrid() {
        self.gridData = .generateNumberGrid(width: targetSize.width, height: targetSize.height)
        self.gridData = gridData.hideAll()

        let sequence = AnimationSequence(duration: 0.01)

        let totalRows = gridData.rowCount

        // Show rows
        switch animationStyle {
        case .header:
            // single row at a time
            for r in 0...totalRows {
                let delay = Double.random(in: 0.1...0.3)
                sequence.append(delay: delay) {
                    self.gridData = gridData.hide(rows: Array(r...totalRows))
                }
            }

        case .fullscreen:
            // few rows at a time
            var r: Int = 0
            while r < totalRows {
                r += Int.random(in: 2...3)
                r = min(r, totalRows)

                let row = r
                sequence.append(delay: 0.1) {
                    self.gridData = gridData.hide(rows: Array(row...totalRows))
                }
            }
        }

        sequence.wait(for: 0.5)

        // Determine row to flash
        let flashRow: Int
        switch animationStyle {
        case .header:
            // Guard against totalRows = 0
            flashRow = totalRows > 0 ? Int.random(in: 0..<totalRows) : -1
        case .fullscreen:
            // No flash
            flashRow = -1
        }

        // Highlight rows
        for r in 0...totalRows {
            let delay: Double
            switch animationStyle {
            case .header:
                delay = Double.random(in: 0.1...0.3)
            case .fullscreen:
                delay = 0.1
            }

            sequence.append(delay: delay) {
                self.gridData = gridData.highlight(row: r)
            }

            if r == flashRow {
                sequence.append(delay: 0.1) {
                    self.gridData = gridData.unhighlightAll()
                }
                sequence.append(delay: 0.1) {
                    self.gridData = gridData.highlight(row: r)
                }
                sequence.append(delay: 0.1) {
                    self.gridData = gridData.unhighlightAll()
                }
                sequence.append(delay: 0.1) {
                    self.gridData = gridData.highlight(row: r)
                }
            }
        }

        sequence
            .wait(for: 2)
            .onFinish {
                self.animateGrid()
            }
            .start()
    }
}

struct NumbersGrid_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGridView(animationStyle: .fullscreen)
            .padding()
            .frame(
                minWidth: .zero,
                maxWidth: .infinity,
                minHeight: .zero,
                maxHeight: .infinity
            )
            .background(Color.black)
            .previewLayout(.fixed(width: 800, height: 600))
    }
}

