import Foundation

extension UInt64 {
    
    func timeIntervalSince(timestamp: UInt64) -> TimeInterval {
        var baseInfo = mach_timebase_info_data_t(numer: 0, denom: 0)
        
        guard mach_timebase_info(&baseInfo) == KERN_SUCCESS else { return .nan }
        
        let nano = (self - timestamp) * UInt64(baseInfo.numer) / UInt64(baseInfo.denom)
        let seconds = Double(nano) * 1e-9
        
        return seconds
    }
    
}
