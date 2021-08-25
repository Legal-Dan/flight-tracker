#Interactive menu
def print_menu
  puts "1. Roll for a flight"
  puts "2. Successful Maintenance"
  puts "3. Add penalty"
  puts "4. Save and close"
end

def interactive_menu
  @extra = 0
  @incomplete_maintenance = 0
  load_log
  loop do
    print_menu
    selection = STDIN.gets.chomp
    process(selection)
  end
end

def process(selection)
  case selection
  when "1"
    puts ""
    puts "------------------"
    puts "Incomplete maintenance: #{@incomplete_maintenance}"
    puts "Current penalty: #{@extra}"
    roll
    puts "------------------"
    puts ""
    @incomplete_maintenance += 1
  when "2"
    @incomplete_maintenance = 0
    @extra = 0
    puts ""
    puts "------------------"
    puts "Maintenance completed, incomplete maintenance = #{@incomplete_maintenance}, extra penalties = #{@extra}"
    puts "------------------"
    puts ""
  when "3"
    puts ""
    puts "------------------"
    penalty
    puts "------------------"
    puts ""
  when "4"
    save_log
    exit
  else
    puts "Invalid selection"
  end
end

def roll
  result = rand(100) + (@incomplete_maintenance*5) + @extra
  if result < 85
    puts "#{result}: Successful flight. No effect."
  elsif result == 85
    puts "Successful flight - Explosions: in the extreme cold, when a 
    glacial field is covered by shadow after a period in the sun, it 
    contracts explosively. Explosions can be single, or can occur in 
    clusters, sounding like heavy gunfire."
  elsif result == 86
    puts "#{result}: Successful flight - Glory: rings of light light or dark centres,
    hang in the air. These are caused by thin layers of ice crystals 
    refracting light. If multiple cloud layers exist, multiple Glories 
    may be seen"
  elsif result == 87
    puts "#{result}: Successful flight - Green Sky: this well-known effect happens 
    whenthe sun is close to the horizon, the sky is cloudless, and there 
    is snow on the ground: a section of the sky turns beautiful grass-green.
    Sometimes the band is very large."
  elsif result == 88
    puts "#{result}: Successful flight - Halo: rings of light around the sun or the 
    moon, these are caused by thin layers of ice crystals refracting the 
    light of the body in question. If multiple cloud layers exist, multiple
    halos may also."
  elsif result == 89
    puts "#{result}: Successful flight - Mirages: just like in the desert. Distant 
    scenes reflected over the horizon. Often upside down, sometimes moving 
    at alarming speeds through the sky."
  elsif result == 90
    puts "#{result}: Successful flight - Rainbow Breath: ice crystals freeze in the 
    breath when exhaled, catching the light at the correct angle to be seen 
    (by someone else) as a rainbow shimmer."
  elsif result == 91
    puts "#{result}: Successful flight - Sun Crosses: this is another phenomenon caused 
    by ice in the upper atmosphere—bars of light radiate outward from the 
    sun like a cross. When a sun cross occurs at the same time as a halo, 
    the result is spectacular."
  elsif result == 92
    puts "#{result}: Successful flight - Snowbow: sometimes called a “white rainbow,” 
    these are essentially halos that are occluded by the ground."
  elsif result == 93
    puts "#{result}: Successful flight - St. Elmo’s Fire: blue auras and sparks that 
    linger around antennas, people, tents, etc. Caused by static electricity 
    in the extreme dry cold."
  elsif result == 94
    puts "#{result}: Successful flight - Spatial Disorientation: the very clear air 
    in the Antarctic makes judging distance tricky. Many explorers have 
    seen large mountains far off, and then found them to be small humps in 
    the snow a couple of miles on. A fumbled Spot Hidden roll or Navigate 
    roll might well trigger this problem."
  else
    failure = rand(10)
    if failure == 0
      puts "#{result}: Unsuccessful flight: Interior Systems: heaters, oxygen, 
      internal electrical pilot instruments, radio, etc."
    elsif failure == 1
      puts "#{result}: Unsuccessful flight: Engines: ignition failures, cracked 
      engine blocks, frozen drive shafts, lack of lubrication, etc."
    elsif failure == 2 || failure == 3
      puts "#{result}: Unsuccessful flight: Control wires: too loose, too tight, 
      missing, broken, frozen in place, etc."
    elsif failure == 4 || failure == 5
      puts "#{result}: Unsuccessful flight: Fuel Systems: clogged or broken fuel 
      lines, leaky tanks, broken pumps, etc."
    elsif failure == 6
      puts "#{result}: Unsuccessful flight: Landing Gear or Skids: missing, loose 
      or broken wheel, loose/missing skis, missing tail skid or wheel, 
      fractured undercarriage, loose/broken guy wires, etc."
    elsif failure == 7
      puts "#{result}: Unsuccessful flight: Fuselage: warped or broken frame, snow in 
      interior areas, windows popping out or losing seal, doors that won’t 
      close or won’t open, etc."
    elsif failure == 8 || failure == 9
      puts "#{result}: Unsuccessful flight: Wings/Tail: jammed rudder or ailerons (in 
      any position), broken or missing same, icy buildup on surface, etc."
    end
  end
end

def penalty
  puts "Current penalty: #{@extra}"
  puts "Enter new penalty amount"
  @extra = STDIN.gets.chomp.to_i
end

def save_log
  file = File.open("log.csv", "w")
  csv_line = [@incomplete_maintenance, @extra].join(",")
  file.puts csv_line
  file.close
end

def load_log
  file = File.open("log.csv", "r")
  file.readlines.each do |line|
    inc, ex = line.chomp.split(',')
    @incomplete_maintenance = inc.to_i
    @extra = ex.to_i
  end
  file.close
end

interactive_menu