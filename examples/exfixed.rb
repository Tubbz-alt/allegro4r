#
# Example program (C Version) for the Allegro library, by Shawn Hargreaves.
#   (Ruby port by Jason Frey)
#
# This program demonstrates how to use fixed point numbers, which
# are signed 32-bit integers storing the integer part in the
# upper 16 bits and the decimal part in the 16 lower bits. This
# example also uses the unusual approach of communicating with
# the user exclusively via the allegro_message() function.
#

require 'rubygems'
require 'allegro4r'
include Allegro4r::API

begin
  exit 1 if allegro_init != 0

  # convert integers to fixed point like this
  x = itofix(10)

  # convert floating point to fixed point like this
  y = ftofix(3.14)

  # fixed point variables can be assigned, added, subtracted, negated,
  # and compared just like integers, eg:
  z = x + y
  allegro_message("%f + %f = %f\n" % [fixtof(x), fixtof(y), fixtof(z)])

  # you can't add integers or floating point to fixed point, though:
  #    z = x + 3
  # would give the wrong result.

  # fixed point variables can be multiplied or divided by integers or
  # floating point numbers, eg:
  z = y * 2
  allegro_message("%f * 2 = %f\n" % [fixtof(y), fixtof(z)])

  # you can't multiply or divide two fixed point numbers, though:
  #    z = x * y;
  # would give the wrong result. Use fixmul() and fixdiv() instead, eg:
  z = fixmul(x, y)
  allegro_message("%f * %f = %f\n" % [fixtof(x), fixtof(y), fixtof(z)])

  # fixed point trig and square root are also available, eg:
  z = fixsqrt(x)
  allegro_message("fixsqrt(%f) = %f\n" % [fixtof(x), fixtof(z)])
ensure
  # JF - you must ensure allegro_exit is called to prevent Ruby from crashing
  allegro_exit
end
