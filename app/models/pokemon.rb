#app/models/pokemon.rb

class Pokemon < ActiveRecord::Base 
	extend FriendlyId

  include SearchCop

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

  # validates :username, presence: true, uniqueness: true

  friendly_id :slug_candidates, use: [:slugged, :finders]

  search_scope :search do
    attributes :name, :slug
  end

  def slug_candidates
    [ :name, [:id, :name] ]
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end

end