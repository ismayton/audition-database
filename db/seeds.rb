# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def test_piece_excerpt_composer
    piece = Piece.find_or_create_by(title: "Ein Heldenleben")
    piece.composer = Composer.find_or_create_by(name: "Ricard Strauss")

    excerpt_locations = [
        "Beginning – 3 m. before Reh 2",
        "1 m. before Reh 78 – Reh 82",
        "Pickup to Reh 107 – end"
    ]
    excerpt_locations.each do |location|
        excerpt = Excerpt.find_or_create_by(location: location)
        excerpt.piece = piece
        excerpt.save
    end
end

def test_list
    list = List.find_or_create_by(date: Date.parse('June 16, 2019'))
    list.position = Position.find_by(title: "Second Horn")
    list.orchestra = Orchestra.find_by(name: "Philadelphia Orchestra")
    list.excerpts << Excerpt.all 
    list.save
end

INSTRUMENTS = {
    "Violin" => [
        "Concertmaster", 
        "Co-Concertmaster", 
        "Assistant Concertmaster",
        "Section First Violin",
        "Principal Second Violin",
        "Assistant Principal Second Violin",
        "Section Second Violin"
    ],

    "Viola" => [
        "Principal Viola",
        "Associate Principal Viola",
        "Assistant Principal Viola",
        "Section Viola"
    ],

    "Cello" => [
        "Principal Cello",
        "Associate Principal Cello",
        "Assistant Principal Cello",
        "Section Cello"
    ],

    "Bass" => [
        "Principal Bass",
        "Associate Principal Bass",
        "Assistant Principal Bass",
        "Section Bass"
    ],

    "Oboe" => [
        "Principal Oboe",
        "Associate Principal Oboe",
        "Second Oboe",
        "English Horn"
    ],

    "Flute" => [
        "Principal Flute",
        "Associate Principal Flute",
        "Second Flute",
        "Piccolo"
    ],

    "Clarinet" => [
        "Principal Clarinet",
        "Associate Principal Clarinet",
        "Second Clarinet",
        "Bass Clarinet"
    ],

    "Bassoon" => [
        "Principal Bassoon",
        "Associate Principal Bassoon",
        "Second Bassoon",
        "Contrabassoon"
    ],

    "Trumpet" => [
        "Principal Trumpet",
        "Associate Principal Trumpet",
        "Assistant Principal Trumpet",
        "Second Trumpet"
    ],

    "Horn" => [
        "Principal Horn",
        "Associate Principal Horn",
        "Assistant Principal Horn",
        "Second Horn",
        "Third Horn",
        "Fourth Horn"
    ],

    "Trombone" => [
        "Principal Trombone",
        "Associate Principal Trombone",
        "Assistant Principal Trombone",
        "Second Trombone",
        "Bass Trombone"
    ],

    "Tuba" => [ "Principal Tuba" ],

    "Harp" => [ "Principal Harp" ],

    "Percussion" => [
        "Principal Percussion",
        "Section Percussion",
        "Timpani"
    ],

    "Keyboard" => [ "Principal Keyboard" ],

    "Other" => []
}

POSITIONS = [
    "Concertmaster",
    "Co-Concertmaster",
    "Assistant Concertmaster",
    "Section First Violin",

    "Principal Second Violin",
    "Assistant Principal Second Violin",
    "Section Second Violin",

    "Principal Viola",
    "Associate Principal Viola",
    "Assistant Principal Viola",
    "Section Viola",

    "Principal Cello",
    "Associate Principal Cello",
    "Assistant Principal Cello",
    "Section Cello",

    "Principal Bass",
    "Associate Principal Bass",
    "Assistant Principal Bass",
    "Section Bass",
    
    "Principal Flute",
    "Associate Principal Flute",
    "Second Flute",
    "Piccolo",
    
    "Principal Oboe",
    "Associate Principal Oboe",
    "Second Oboe",
    "English Horn",

    "Principal Clarinet",
    "Associate Principal Clarinet",
    "Second Clarinet",
    "Bass Clarinet",

    "Principal Bassoon",
    "Associate Principal Bassoon",
    "Second Bassoon",
    "Contrabassoon",
    
    "Principal Horn",
    "Associate Principal Horn",
    "Assistant Principal Horn",
    "Second Horn",
    "Third Horn",
    "Fourth Horn",

    "Principal Trumpet",
    "Associate Principal Trumpet",
    "Assistant Principal Trumpet",
    "Second Trumpet",
    
    "Principal Trombone",
    "Associate Principal Trombone",
    "Assistant Principal Trombone",
    "Second Trombone",
    "Bass Trombone",
    
    "Tuba",

    "Principal Harp",
    "Principal Percussion",
    "Section Percussion",
    "Timpani",

    "Principal Keyboard"
]

ORCHESTRAS = [
    "Alabama Symphony",
    "Atlanta Symphony Orchestra",
    "Baltimore Symphony Orchestra",
    "Boston Symphony Orchestra",
    "Buffalo Philharmonic Orchestra",
    "Charlotte Symphony Orchestra",
    "Chicago Symphony Orchestra",
    "Cincinnati Symphony Orchestra",
    "Cleveland Orchestra",
    "Columbus Symphony Orchestra",
    "Dallas Symphony Orchestra",
    "Denver Symphony Orchestra",
    "Detroit Symphony Orchestra",
    "Florida Orchestra",
    "Fort Worth Symphony Orchestra",
    "Grand Rapids Symphony",
    "Grant Park Symphony Orchestra",
    "Hartford Symphony",
    "Honolulu Symphony Orchestra",
    "Houston Symphony",
    "Indianapolis Symphony Orchestra",
    "Jacksonville Symphony Orchestra",
    "Kansas City Philharmonic",
    "Kansas City Symphony",
    "Kennedy Center Opera House Orchestra",
    "Los Angeles Philharmonic",
    "Louisiana Philharmonic",
    "Louisville Orchestra",
    "Lyric Opera of Chicago",
    "Metropolitan Opera Orchestra",
    "Milwaukee Symphony Orchestra",
    "Minnesota Orchestra",
    "Montreal Symphony Orchestra",
    "Nashville Symphony Orchestra",
    "National Symphony Orchestra",
    "New Haven Symphony",
    "New Jersey Symphony Orchestra",
    "New York City Ballet Orchestra",
    "New York City Opera Orchestra",
    "New York Philharmonic",
    "North Carolina Symphony",
    "Oregon Symphony Orchestra",
    "Philadelphia Orchestra",
    "Phoenix Symphony Orchestra",
    "Pittsburgh Symphony Orchestra",
    "Rochester Philharmonic Orchestra",
    "Saint Louis Symphony Orchestra",
    "Saint Paul Chamber Orchestra",
    "San Antonio Symphony",
    "San Diego Symphony Orchestra",
    "San Francisco Ballet Orchestra",
    "San Francisco Opera Orchestra",
    "San Francisco Symphony Orchestra",
    "Seattle Symphony",
    "Syracuse Symphony Orchestra",
    "Toledo Symphony Orchestra",
    "Toronto Symphony Orchestra",
    "Utah Symphony Orchestra",
    "Vancouver Symphony",
    "Virginia Symphony"
]

COMPOSERS = {
    "L.V. Beethoven" => [],
    "Johannes Brahms" => [],
    "Hector Berlioz" => [],
    "Antonin Dvorak" => [],
    "Joseph Haydn" => [],
    "John Harbison" => [],
    "Gustav Mahler" => [],
    "Felix Mendelssohn" => [],
    "W.A. Mozart" => [],
    "Sergei Prokofiev" => [],
    "Maurice Ravel" => [],
    "Camille Saint-Saens" => [],
    "Robert Schumann" => [],
    "Ricard Strauss" => [],
    "Igor Stravinsky" => []
}

EXCERPTS = [

]

def populate_instruments_and_positions

    INSTRUMENTS.each do |instrument_name, position_names|
        instrument = Instrument.find_or_create_by(name: instrument_name)
        position_names.each do |title| 
            position = Position.find_or_create_by(title: title)
            position.instrument = instrument
            position.save
        end
    end
end

def populate_orchestras
    ORCHESTRAS.each do |name| 
        o = Orchestra.find_or_create_by(name: name)
        o.positions = Position.all
    end
end 

def full_test
    populate_instruments_and_positions
    populate_orchestras
    test_piece_excerpt_composer
    test_list
end

full_test
