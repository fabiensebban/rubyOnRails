#app/models/pokemon.rb

class Pokemon < ActiveRecord::Base 

	belongs_to :type
	has_many :pokemon_moves
  	has_many :moves, through: :pokemon_moves

  	has_attached_file :avatar, styles: {
  		medium: '300x300>',
  		thumb: '100x100>'
  	}

  	validates_attachment_content_type :avatar, content_type: /\Aimage/
  	validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  	validates_with AttachmentSizeValidator,
  		attributes: :avatar,
  		less_than: 1.megabytes
  	do_not_validate_attachment_file_type :avatar

end