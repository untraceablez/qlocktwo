#!/usr/bin/env ruby

require 'date'

now = DateTime.now
hour = now.hour
minute = now.min
minutes = [
  "           \n           \n           \n       ",
  "           \n      FIVE \n           \nPAST   ",
  "           \n           \n    TEN    \nPAST   ",
  "A QUARTER  \n           \n           \nPAST   ",
  "           \nTWENTY     \n           \nPAST   ",
  "           \nTWENTYFIVE \n           \nPAST   ",
  "           \n           \nHALF       \nPAST   ",
  "           \nTWENTYFIVE \n         TO\n       ",
  "           \nTWENTY     \n         TO\n       ",
  "A QUARTER  \n           \n       TO  \n       ",
  "           \n           \n    TEN  TO\n       ",
  "           \n      FIVE \n       TO  \n       "
  ]

hours = [
   "    \n           \n           \n           \n     TWELVE\n     ",
   "    \nONE        \n           \n           \n           \n     ",
   "    \n           \n        TWO\n           \n           \n     ",
   "    \n      THREE\n           \n           \n           \n     ",
   "    \n           \nFOUR       \n           \n           \n     ",
   "    \n           \n    FIVE   \n           \n           \n     ",
   "    \n   SIX     \n           \n           \n           \n     ",
   "    \n           \n           \n           \nSEVEN      \n     ",
   "    \n           \n           \nEIGHT      \n           \n     ",
   "NINE\n           \n           \n           \n           \n     ",
   "    \n           \n           \n           \n           \nTEN  ",
   "    \n           \n           \n     ELEVEN\n           \n     ",
   "    \n           \n           \n           \n     TWELVE\n     "

   ]

output = "IT IS      \n"
output+= minutes[minute/5]

hour -=12 if hour > 12 #convert from 24hours format

if(minute >= 35)
  if(hour == 12)
	hour = 1
  else
	hour +=  1
  end
end


output+= hours[hour]
output+="OCLOCK" if minute/5 == 0

if(ARGV.include?("-a") || ARGV.include?("-an") || ARGV.include?("-na"))
  antistring ="ITLISASTIME\nACQUARTERDC\nTWENTYFIVEX\nHALFTENOFTO\nPASTERUNINE\nONESIXTHREE\nFOURFIVETWO\nEIGHTELEVEN\nSEVENTWELVE\nTENSEOCLOCK"
  (0..output.length-1).each { |i| antistring[i] = (output[i] == ?\s || output[i]==?\n) ? antistring[i]:?\s }

  if(ARGV.include?("-n") || ARGV.include?("-an") || ARGV.include?("-na"))
	puts antistring
  else
	antistring.each_byte { | l |   print l.chr +  (l==?\n ? "" : " ") }
  end
elsif(ARGV.include?("-n"))
  puts output
elsif(ARGV.length > 0)
  printf "Not valid use:\n\n -a to display the 'anti-string'\n -n display the string without spaces\n"
else
  output.each_byte { | l |   print l.chr +  (l==?\n ? "" : " ") }
end
