require 'open-uri'

class CoursesController < ApplicationController
#  def create
#    @user = User.find(params[:user_id])
#    @course = @user.courses.create(params[:course])
#    weblink = @course.weblink
#    begin
#      html = open(weblink) {|f| f.read}
#    rescue Errno::ENOENT
#      logger.info "Malformed or unavailable URL"
#    end
#    @course.update_attributes({:html_source => html, :updated => false})
#    redirect_to user_path(@user)
#  end
  
  def create
    @user = User.find(params[:user_id])
    @course = @user.courses.build(params[:course])
  
    weblink = @course.weblink
    begin
      html = open(weblink) {|f| f.read}
    rescue Errno::ENOENT
      logger.info "Malformed or unavailable URL"
    end
    
    respond_to do |format|

      if @course.save
        format.html {redirect_to user_path(@user), :notice => 'Course was successfully added.'}
      else
        format.html {render :action => '../users/show'}
        format.json {render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
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
