class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    input=params.fetch("path_id") # fetch parameters first!!!!!!!!!!!!!
    matching_photos=Photo.where({ :id => input})
    @photo=matching_photos.at(0) # be logic

    render({:template => "photo_templates/show.html.erb"})
  end

  def delete
    input=params.fetch("path_id") # fetch parameters first!!!!!!!!!!!!!
    matching_photos=Photo.where({ :id => input})
    photo=matching_photos.at(0) # be logic
    photo.destroy
    # render({:template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def create
    input_image=params.fetch("input_image")
    input_caption=params.fetch("input_caption")
    input_owner_id=params.fetch("input_owner_id")
    p=Photo.new
    p.image=input_image
    p.caption=input_caption
    p.owner_id=input_owner_id
    p.save
    # render({:template => "photo_templates/create.html.erb"})
    redirect_to("/photos/"+ p.id.to_s)
  end

  def update
    input_image=params.fetch("input_image")
    input_caption=params.fetch("input_caption")
    input=params.fetch("path_id") # fetch parameters first!!!!!!!!!!!!!

    matching_photos=Photo.where({ :id => input})
    photo=matching_photos.at(0) # be logic

    photo.image=input_image
    photo.caption=input_caption
    photo.save
    # render({:template => "photo_templates/update.html.erb"})
    redirect_to("/photos/"+ photo.id.to_s)
  end

  def comment
    input_comment=params.fetch("input_comment")
    input_author_id=params.fetch("input_author_id")
    input=params.fetch("path_id") # fetch parameters first!!!!!!!!!!!!!

    matching_photos=Photo.where({ :id => input})
    photo=matching_photos.at(0) # be logic 
    new_comment=Comment.new
    new_comment.photo_id=input
    new_comment.author_id=input_author_id
    new_comment.body=input_comment
    new_comment.save
    redirect_to("/photos/"+ photo.id.to_s)

  end
end
