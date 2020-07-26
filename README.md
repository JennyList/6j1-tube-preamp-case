# 6j1-tube-preamp-case

This is an OpenSCAD file that creates a case for the ubiquitous cheap Chinese 6J1-based tube audio preamp kits. I bought one as an example piece for some Hackaday articles about audio, and since it's a bare PCB and thus a bit fragile, it needs a case to protect the tubes.

There are two modules that create the case, topHalf() and bottomHalf(), which create as you might expect the top and bottom halves of the case. Run each one separately in OpenSCAD to generate each model. Turn the top half upside down to 3D print it. No support should be needed for either one.

You'll need four small self-tapping screws to hold the case together, and a couple more to attach the sockets to the rear panel if you want.

I've provided an extra hole in the rear for a headphone socket. Out of the box this kit is too high impedance to drive headphones, so I'll be experimenting with source followers to provide a low impedance output.

STLs can be found on Thingiverse: https://www.thingiverse.com/thing:4553338
