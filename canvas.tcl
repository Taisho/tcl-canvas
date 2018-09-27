#!/usr/bin/env wish

namespace eval CSlider {

	proc new { name } {
		set bar 0

		canvas "$name"

		set bar [$name create rectangle 40 0 40 50 -fill black]
		puts "barId: $bar"

		rename ::$name ::mega$name

		proc ::$name { args } {
			set name [lindex [info level 0] 0]
			set option [lindex $args 0]

			if {[string compare $option configure] == 0 } {
				set width [lindex $args 1]
				set height [lindex $args 2]
				$name coords $bar 40 0 41 $height
	        }	
	    }

	return $name
	}
}

proc cslider { name } {
	CSlider::new $name	
	puts "name: $name"
	return $name
}

proc main {} {
	pack [cslider .c] -fill both -expand yes
	bind .c <Configure> { %W configure %w %h }
}

main
