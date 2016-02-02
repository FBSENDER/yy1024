class VideoController < ApplicationController

  def show
    id = params[:id]
    @video = Video.where(id: id).take
    not_found if @video.nil?
    @comments = JSON.parse(@video.comments_json)
    @related_videos = Video.where("id > ? and status = 1", @video.id).select(:name,:id,:small_img_url).take(8)
  end

  def tag
    @tag_name = params[:tag_name]
    @tag = Tag.where("name = ?", @tag_name).take
    not_found if @tag.nil?
  end

  def category
    @category_name = params[:category_name] || '极限运动'
    @category = Category.where(name: @category_name).take
    not_found if @category.nil?
    @tags = Tag.where(id: @category.tag_ids.split(',').sample(8)).select(:name,:img_url,:small_img_url,:description,:hot_video_ids,:new_video_ids).to_a
  end

end
