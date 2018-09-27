#!/usr/bin/env wish

namespace eval canvas {

	set height 0
	set width 0
	set bar 0

	proc configure { width_ height_} {
		variable width
		variable height	
		variable bar

		set width $width_
		set height $height_

		puts [.c coords $bar]
		after 10 ".c coords $bar 40 0 41 $height"
	}

	proc draw {} {
		variable height
		variable width 
		variable bar

		set bar [.c create rectangle 40 0 40 50 -fill black]
		puts "barId: $bar"
	}
}

proc main {} {
	pack [canvas .c] -fill both -expand yes
	bind .c <Configure> { canvas::configure %w %h }

	canvas::draw
}

main
