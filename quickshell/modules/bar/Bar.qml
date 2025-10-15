import Quickshell
import "../../core/"

Scope {

	Variants {
	  model: Quickshell.screens
	
    PanelWindow {	
      required property var modelData
      screen: modelData

	    anchors {
	      top: true
	      left: true
	      right: true
	    }
		
	    implicitHeight: 40

       ClockWidget {
         anchors.centerIn: parent
       }
    }
  }
}
