###############################
# to run use:
#    $ ruby ./generate.rb



require 'pixelart'


## todo/fix: add "generic" Composite.read helper to pixelart upstream!!!!
path = "./i/dodge.png"
img = ChunkyPNG::Image.from_file( path )
dodges = ImageComposite.new( img, width: 24, height: 24 )




BACKGROUND_SPOTS = [
 # blue-ish
 '49355E', '16437A', '096598', '4B8BBB', '9CD9DE', 'C5A7C6',
 # red-ish
 'A5282C', 'D14C37', 'CF6A71', 'DD5E36', 'DDA315', 'F3A925',
 # green-ish
 '4C7031', '95A025', '66BA8C', '316D5F',
 # gray-ish /white-ish
 'C2B6AF', 'BFC0C5', '3BC8B5',
]



## note: count returns tile count (number of tile images in composite)
dodges.count.times do |id|
  dodge = dodges[id]


  ###
  #  for testing generate "basic"
  #     dodge images with spots (no background)
  dodge_spots = dodge.spots( 10 )
  dodge_spots.save( "./tmp/dodge-#{id}-spots-v1.png" )

  dodge_spots = dodge.spots( 5, spacing: 5, center: [-1,1], radius: [3,6] )
  dodge_spots.save( "./tmp/dodge-#{id}-spots-v2.png" )


  #####
  #  collection no 1
  dodge_spots = dodge.zoom(2).spots( 5, spacing: 5,
                             center: [-1,1], radius: [3,6],
                             background: BACKGROUND_SPOTS )

  dodge_spots.save( "./o/no1/dodge-#{id}-currency@2x.png" )


  #####
  #  collection no 2
  dodge_spots = dodge.zoom(2).spots( 5, spacing: 5,
                             center: [-3,3], radius: [2,8],
                             background: BACKGROUND_SPOTS )

  dodge_spots.save( "./o/no2/dodge-#{id}-currency@2x.png" )


  dodge_spots = dodge.zoom(2).spots_hidef( 5, spacing: 5,
                              center: [-3,3], radius: [2,8],
                              background: BACKGROUND_SPOTS )

  dodge_spots.save( "./o/no2/dodge-#{id}-currency@2x.svg" )
end



puts "bye"
