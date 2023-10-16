import Foundation
import DGCharts
open class LargeValueFormatter: NSObject, ValueFormatter, AxisValueFormatter
{
    fileprivate static let MAX_LENGTH = 5
    fileprivate static let MIN_LENGTH = -5
    open var suffix = ["p","n","µ", "m", "" ,"k", "M", "MM", "T"]
    open var appendix: String?
    public override init()
    {
    }
    public init(appendix: String?)
    {
        self.appendix = appendix
    }
    fileprivate func format(value: Double) -> String
    {
        var sign = 0.0
        var sig = abs(value)
        if value == 0
        {
            sign = 1
        }
        else
        {
            sign = value / abs(value)
        }
        var length = 0
        let maxLength = (suffix.count / 2) - 1
        if sig >= 1000
        {
            while sig >= 1000.0 && length < maxLength
            {
                sig /= 1000.0
                length += 1
            }
        }
        else
        {
            while sig <= 1 && length < maxLength
            {
                sig *= 1000.0
                length += 1
            }
        }
        if value == 0
        {
            length = 0
        }
        var r = "$" + String(format: "%2.f", sig * sign) + suffix[length + 4] + " "
        if appendix != nil
        {
            r += appendix!
        }
        return r
    }
    open func stringForValue( _ value: Double, axis: AxisBase?) -> String
    {
        return format(value: value)
    }
    open func stringForValue(
        _ value: Double,
        entry: ChartDataEntry,
        dataSetIndex: Int,
        viewPortHandler: ViewPortHandler?) -> String
    {
        return format(value: value)
    }
}
