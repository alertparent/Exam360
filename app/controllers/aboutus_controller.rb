class AboutusController < ApplicationController
  filter_access_to :all
  def index
        @aboutus_english = Aboutus.find_by(:locale_id=>1)
        @aboutus_french = Aboutus.find_by(:locale_id=>2)
        @aboutus_arabic = Aboutus.find_by(:locale_id=>3)
        @aboutus_chinese = Aboutus.find_by(:locale_id=>4)
  end
  
  def create
    @aboutus_english = Aboutus.find_by(:locale_id=>1)
    @aboutus_french = Aboutus.find_by(:locale_id=>2)
    @aboutus_arabic = Aboutus.find_by(:locale_id=>3)
    @aboutus_chinese = Aboutus.find_by(:locale_id=>4)
    
    @aboutus_english.description = params[:content_english]
    @aboutus_french.description = params[:content_french]
    @aboutus_arabic.description = params[:content_arabic]
    @aboutus_chinese.description = params[:content_chinese]
    if @aboutus_english.save and @aboutus_french.save and @aboutus_arabic.save and @aboutus_chinese.save
      flash[:success] = t('flash_success.about_us')  
      redirect_to :action=>"index"
    end
  end

end


