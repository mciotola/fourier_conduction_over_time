puts "\n\n"
puts "###############################################################################"
puts "#                                                                             #"
puts "# FOURIER HEAT CONDUCTION LAW - CONSTANT FLOW             version 01.10       #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Copyright 2011-17 by Mark Ciotola; available for use under GNU license      #"
puts "# Created on 23 December 2014 or earlier. Last revised on 9 May 2017          #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Description:                                                                #"
puts "# This simulation calculates the flow of heat energy across a thermal         #"
puts "# conductor that connects a warmer object to a cooler object.                 #"
puts "# Both reservoirs are exhaustible.                                            #"
puts "#                                                                             #"
puts "# Website: http://www.heatsuite.com                                           #"
puts "#                                                                             #"
puts "###############################################################################"
puts "\n\n"

      ###############################################################################
      #                                                                             #
      # Developed with Ruby 1.9.2, 2.2.4                                            #
      # Takes the following parameters: temperature of reservoirs                   #
      #                                 conductor material                          #
      #                                 conductor area                              #
	  #                                 conductor length                            #
      #                                                                             #
      # Website: http://www.heatsuite.com                                           #
      # Source site: https://github.com/mciotola/fouriers_law_of_heat_conduction    #
      ###############################################################################


puts "================================== Background =================================\n\n"
  
  puts " Fourier's Law of Conduction describes the flow of thermal energy     "
  puts " through a conductor bridging two thermal reservoirs of differing temperature. "
  puts " In this simulation the temperature difference remains constant with time."
  puts "\n"
  puts " dQ/dt = (k A ) (d T / d L) \n"  
  puts " k = thermal conductivity of material \n"  
  puts "\n\n"

  
# INCLUDE LIBRARIES & SET-UP

  include Math
  require 'csv'
  prompt = "> "
  
  
# SET SIMULATION PARAMETERS

  periods = 200  # seconds of time
  material = 'copper' #'iron' 'wood'
  area = 1.0
  length = 200.0

  hottemp = 1000 # Kelvin
  coldtemp = 300 # Kelvin

# Look-up material thermal conductivity

  if material == 'iron'  # (Watts/(meter Kelvin))
    thermalconductivity = 80.0
    elsif material == 'copper'
    thermalconductivity = 400.0
    elsif material == 'wood'
    thermalconductivity = 0.08
  end


# Initialize simulation variables

  time = 0 # s; this is an integer variable

  tempdiff = hottemp - coldtemp
  heatenergyflow = ( (area * thermalconductivity) / length) * tempdiff

  cumenergyflow = 0.0

  entropyflowhot = 0.0
  entropyflowcold = 0.0
  entropychange = 0.0

  cumentropychange = 0.0


# optional output file
puts "\n"
puts "What is the desired name for your output file? [fourier_conduction_constant.csv]:"
print prompt
output_file = STDIN.gets.chomp()

if output_file > ""
    output_file = output_file
	else
    output_file = "fourier_both_rsvr_inex.csv"
end

# target = File.open(output_file, 'w')

# Display the parameters

  puts "================================== Parameters =================================\n\n"

  puts sprintf "  Hot temp (in K): \t\t %7.3f " , hottemp.to_s
  puts sprintf "  Cold temp (in K): \t\t %7.3f " , coldtemp.to_s

  puts sprintf "  Thermal conductivity: \t %7.3f %s" , thermalconductivity.to_s, " in Watts/meter/Kelvin"
  puts sprintf "  Area (in m^2): \t\t %7.3f " , area.to_s
  puts sprintf "  Length (in m): \t\t %7.3f " , length.to_s
  puts sprintf "  Material: \t\t\t %7s " , material
  puts "\n\n"  


# Simulation Banner


  puts "\n\n"
  puts "RESULTS: \n\n"

  puts "TIME \tT hot \tT cold\tDiff  \tE Flow \tCumlFlow\tS hot \tS cold \tS Chng\tS Cum Chng"
  puts "-----\t------\t------\t------\t-------\t--------\t------\t-------\t-------\t----------\n"


# Run the simulation

while time < periods + 1  # 1 added to record initial conditions.
    
    # if coldtemp < hottemp

    
    # Display variable short names
    
    t = time
    hott = hottemp
    coldt = coldtemp
    tdiff = tempdiff
    hef = heatenergyflow
    cumef = cumenergyflow
    sfhot = entropyflowhot
    sfcold = entropyflowcold
    sc = entropychange
    cumsc = cumentropychange
    
    # Display the output
    
    mystring = ("%3d\t%6.2f\t%6.2f\t%6.2f\t%7.2f\t%8.2f\t%6.2f\t%7.2f\t%7.2f\t%10.2f")
    puts sprintf mystring, t.to_s, hott.to_s, coldt.to_s, tdiff.to_s, hef.to_s, cumef.to_s, sfhot.to_s, sfcold.to_s, sc.to_s, cumsc.to_s
    
    # Write to Output File
    periodstring = t.to_s+"\t"+hott.to_s+"\t"+coldt.to_s+"\t"+tdiff.to_s+"\t"+hef.to_s+"\t"+cumef.to_s+"\t"+sfhot.to_s+"\t"+sfcold.to_s+"\t"+sc.to_s+"\t"+cumsc.to_s
    
    
    CSV.open(output_file, "a+") do |csv|
        csv << [t.to_s, hott.to_s, coldt.to_s, hef.to_s]
    end
    
    
    #tempdiff = hottemp - coldtemp
      heatenergyflow = ( (area * thermalconductivity) / length) * tempdiff

      cumenergyflow = cumenergyflow + heatenergyflow
  
      entropyflowhot = - heatenergyflow/hottemp
      entropyflowcold = heatenergyflow/coldtemp
  
      entropychange = entropyflowhot + entropyflowcold
  
      cumentropychange = cumentropychange + entropychange



      time = time + 1
    
    # end

  end

puts "\nSimulation is completed. \n\n"


# END MATTER

# Display key and references

  puts "\n\n"
  puts "\n\n"

  puts "================================== Units Key ==================================\n\n"
  puts "  Abbreviation: \t\t Unit:"
  puts "\n"
  puts "       J \t\t\t Joules, a unit of energy"
  puts "       K \t\t\t Kelvin, a unit of temperature"
  puts "       m \t\t\t meters, a unit of length"
  puts "       s \t\t\t seconds, a unit of time"
  puts "\n\n"


  puts "================================== References =================================\n\n"
  puts "Daniel V. Schroeder, 2000, \"An Introduction to Thermal Physics.\""
  puts "\n\n"

# Table of thermal conductivities (Watts/(meter Kelvin))

  # Material	Thermal Conductivity
  # air				  0.026
  # wood			  0.08
  # water			  0.6
  # iron			 80
  # copper			400
