# SwiftEssentialsKit/Convenient

This module includes some convenient functions and structs/classes to speed up development.

## Usage

### Array

```swift
import SwiftEssentialsKit

let array = ["hi", "all", "moarning"]
array.joinedWithNewLine() // => "hi\nall\nmoarning"
array.joinedWithSpace() // => "hi all moarning"
```

### Date

```swift
import SwiftEssentialsKit

let date = Date() // => Example: "12/03/2020 23:40:23"
date.startOfDay() // => "12/03/2020 00:00:00"
date.endOfDay() // => "12/03/2020 23:59:59"
date.yesterday() // => "11/03/2020 23:40:23"
date.tomorrow() // => "13/03/2020 23:40:23"

date.firstDayOfMonth() // => "01/03/2020 23:40:23"
date.lastDayOfMonth() // => "31/03/2020 23:40:23"
date.nextMonth() // => "12/04/2020 23:40:23"
date.previousMonth() // => "12/02/2020 23:40:23"

date.numberOfDays(to: another) // => days between date and another,

date.isToday() // => true
date.isEqual(to: another, granularity: .day) // => true iff date == another, granularity day
date.isLess(than: another, granularity: .day) // => true iff date < another, granularity day
date.isLess(thanOrEqual: another, granularity: .day) // => true iff date <= another, granularity day
date.isGreater(than: another, granularity: .day) // => true iff date > another, granularity day
date.isGreater(thanOrEqual: another, granularity: .day) // => true iff date >= another, granularity day

date.string(.yyyyMMdd) // => "2020-03-12"
```

### String

```swift
import SwiftEssentialsKit

" hi ".trimmed // => "hi"
"12".asInt // => 12
"12.0".asFloat // => 12.0
"123.32".asDouble // => 123.32

"2020-03-12".date(.yyyyMMdd) // => Date("12/03/2020 00:00:00")
```

### Int

```swift
import SwiftEssentialsKit

12.asString // => "12"
```
