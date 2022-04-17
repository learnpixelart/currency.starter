###############################
# to run use:
#    $ ruby ./doge/generate.rb


require 'pixelart'


doges = ImageComposite.read( "./i/doge.png", width: 24, height: 24 )

pp doges.count  #=> 25



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



doges.each_with_index do |doge, id|
  puts "==> doge #{id}..."

  ###
  #  for testing generate "basic"
  #     doge images with spots (no background)
  doge_spots = doge.spots( 10 )
  doge_spots.save( "./tmp/doge-#{id}-spots-v1.png" )

  doge_spots = doge.spots( 5, spacing: 5, center: [-1,1], radius: [3,6] )
  doge_spots.save( "./tmp/doge-#{id}-spots-v2.png" )


  #####
  #  collection no 1
  doge_spots = doge.zoom(2).spots( 5, spacing: 5,
                             center: [-1,1], radius: [3,6],
                             background: BACKGROUND_SPOTS )

  doge_spots.save( "./o/no1/doge-#{id}-currency@2x.png" )


  #####
  #  collection no 2
  doge_spots = doge.zoom(2).spots( 5, spacing: 5,
                             center: [-3,3], radius: [2,8],
                             background: BACKGROUND_SPOTS )

  doge_spots.save( "./o/no2/doge-#{id}-currency@2x.png" )


  doge_spots = doge.zoom(2).spots_hidef( 5, spacing: 5,
                              center: [-3,3], radius: [2,8],
                              background: BACKGROUND_SPOTS )

  doge_spots.save( "./o/no2/doge-#{id}-currency@2x.svg" )
end



puts "bye"
