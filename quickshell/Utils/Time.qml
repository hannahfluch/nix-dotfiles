pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm:ss");
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
