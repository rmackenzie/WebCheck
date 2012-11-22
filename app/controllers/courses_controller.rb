require 'open-uri'
class CoursesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @course = @user.courses.create(params[:course])
    weblink = @course.weblink
    html = open(weblink) {|f| f.read}
    @course.update_attributes({:html_source => html, :updated => false})
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @course = @user.courses.find(params[:id])
    @course.destroy
    redirect_to user_path(@user)
  end
  
  def update_courses
    @user = User.find(params[:user_id])
    
    
    
    
    @user.courses.each do |c| 
    weblink = c.weblink
      html = open(weblink) {|f| f.read}
      if html != c.html_source
        c.update_attributes({:html_source => html, :updated=> true})
      else
        c.update_attributes({:updated => false})
      end
   end
      redirect_to user_path(@user)
  end

end
