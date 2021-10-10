class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # accepts_nested_attributes_for :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil
  end 

  def note_contents=(contents)
    contents.each do |c|
      note = Note.new
      note.content = c
      self.notes << note
    end 
  end 

  def note_contents
    contents = []
    self.notes.map do |n|
      contents << n.content
    end
    contents
  end
end