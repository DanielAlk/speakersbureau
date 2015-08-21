class AddImageToSpekaerImage < ActiveRecord::Migration
  def up
    add_attachment :speaker_images, :image
  end

  def down
    remove_attachment :speaker_images, :image
  end
end
