class Tag < ActiveRecord::Base
  self.table_name = 'yy_video_tags'

  def hot_videos
    Video.where(id: self.hot_video_ids.split(',')).select(:name,:id,:small_img_url).to_a
  end

  def new_videos
    Video.where(id: self.new_video_ids.split(',')).select(:name,:id,:small_img_url).to_a
  end

  def sample_videos
    Video.where(id: self.all_video_ids.split(',').sample(20)).select(:name,:id,:small_img_url).to_a
  end
end
