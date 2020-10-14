# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


excerpt = Excerpt.find_or_create_by(title: "Ein Heldenleben")
excerpt.composer = Composer.find_or_create_by(name: "Ricard Strauss")
excerpt.save

position = Position.find_or_create_by(title: "Second Horn")
orchestra = Orchestra.find_or_create_by(name: "Philadelphia Orchestra")
orchestra.positions << position

list = List.find_or_create_by(date: "Today")
list.excerpts << Excerpt.all 
list.save

position.lists << list
orchestra.lists << list
position.save




# sections_list = {
#     "Violin" => {},
#     "Viola" => {},
#     "Cello" => {},
#     "Bass" => {},
#     "Oboe" => {},
#     "Flute" => {},
#     "Clarinet" => {},
#     "Bassoon" => {},
#     "Trumpet" => {},
#     "Horn" => {},
#     "Trombone" => {},
#     "Tuba" => {},
#     "Harp" => {},
#     "Percussion" => {},
#     "Keyboard" => {},
#     "Timpani" => {}
# }

# positions_list = {
#     Concertmaster
#     Co-Concertmaster
#     Assistant Concertmaster
#     Section First Violin

#     Principal Second Violin
#     Assistant Principal Second Violin
#     Section Second Violin

#     Principal Viola
#     Associate Principal Viola
#     Assistant Principal Viola
#     Section Viola

#     Principal Cello
#     Associate Principal Cello
#     Assistant Principal Cello
#     Section Cello

#     Principal Bass
#     Associate Principal Bass
#     Assistant Principal Bass
#     Section Bass
    
#     Principal Flute
#     Associate Principal Flute
#     Second Flute
#     Piccolo
    
#     Principal Oboe
#     Associate Principal Oboe
#     Second Oboe
#     English Horn

#     Principal Clarinet
#     Associate Principal Clarinet
#     Second Clarinet
#     Bass Clarinet

#     Principal Bassoon
#     Associate Principal Bassoon
#     Second Bassoon
#     Contrabassoon
    
#     Principal Horn
#     Associate Principal Horn
#     Assistant Principal Horn
#     Second Horn 
#     Third Horn
#     Fourth Horn

#     Principal Trumpet
#     Associate Principal Trumpet
#     Assistant Principal Trumpet
#     Second Trumpet
    
#     Principal Trombone
#     Associate Principal Trombone
#     Assistant Principal Trombone
#     Second Trombone
    
#     Tuba

#     Principal Harp
#     Principal Percussion
#     Section Percussion
#     Timpani

#     Principal Keyboard
# }
