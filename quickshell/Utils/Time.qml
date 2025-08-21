pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm:ss");
    }
    readonly property string date: {
        let now  = clock.date
        let dayName = now.toLocaleDateString(Qt.locale(), "ddd")
        dayName = dayName.charAt(0).toUpperCase() + dayName.slice(1)
        let day = now.getDate()
        let suffix
        if (day > 3 && day < 21)
        suffix = 'th'
        else
        switch (day % 10) {
          case 1:
          suffix = "st"
          break
          case 2:
          suffix = "nd"
          break
          case 3:
          suffix = "rd"
          break
          default:
          suffix = "th"
        }
        let month = now.toLocaleDateString(Qt.locale(), "MMMM")
        let year = now.toLocaleDateString(Qt.locale(), "yyyy")
        return `${dayName}, ${day}${suffix} ${month} ${year}`
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    // Format an easy to read approximate duration ex: 4h32m
    // Used to display the time remaining on the Battery widget
    function formatVagueHumanReadableDuration(totalSeconds) {
      const hours = Math.floor(totalSeconds / 3600)
      const minutes = Math.floor((totalSeconds - (hours * 3600)) / 60)
      const seconds = totalSeconds - (hours * 3600) - (minutes * 60)

      var str = ""
      if (hours) {
        str += hours.toString() + "h"
      }
      if (minutes) {
        str += minutes.toString() + "m"
      }
      if (!hours && !minutes) {
        str += seconds.toString() + "s"
      }
      return str
    }
}
