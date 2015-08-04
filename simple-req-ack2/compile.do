vlog *.sv

# Add -assertdebug to use assertion

vsim bench -voptargs=+acc -assertdebug

# Enable Assertion Thread View (ATV) to specify assertion
#   -enable    ... Turn on assertion thread viewing 
#   -asserts   ... Turn on assertion thread viewing for only assertion
#              (not coverage)
#   -recursive ... Assertion is turned on recursivly from PATH.
#   PATH       ... "/*", Assertion is in effect on this layer specifed by PATH.

atv log -enable -asserts -recursive /*

## To open the Assertion Window:
## View -> Coverage -> Assertions

