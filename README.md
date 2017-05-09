## Description

This program simulates Fourier's Law of Thermal Conduction and calculates the quantity of thermal energy transport over a periods of time. 

## Language

It is written in Ruby 2.2.4.

## Requirements

You must have Ruby 2.2.4+ installed on your computer.

## Running the Program

There may be various ways to run Ruby programs on particular machines. However, these instructions assume that you have access to your computer's command line interface.

To run this file, first download it and place it in an appropriate directory. For example, you may wish to create a subdirectory for Ruby program in your top-level user directory and place the program file in there.

In the command line, go to the directory where the program file is located.

Then enter:

```
ruby fourier_conduction_01_10_instant.rb
```

## Adjusting Parameters

There are several parameters that can be adjusted. The codes needs to be edited to do so, under the *SET SYSTEM PARAMETERS* section.

* periods (seconds)
* material of conductor (must be set to either copper, iron, or wood)
* area (square meters)
* length (meters)
* hot reservour temperature (Kelvin)
* cold reservour temperature (Kelvin)

## Output

This simulation prints results to screen. It also exports the results to a CSV file that
can be names by the user, which can be useful for multiple runs. The default file name is *fourier_conduction_constant.csv*.

## Troubleshooting

If the program does not run, make sure that at least Ruby version 1.9.2 is installed on your computer.

Make that you are in the correct directory.

If you adjusted the parameters, make sure all are positive and have decimal point. Also make sure that you saved the file in a pure text format and that the filename ends in ".rb"

## Copyright and Use Notice

Copyright 2011-17 by Mark Ciotola. Available for use under GNU license.
