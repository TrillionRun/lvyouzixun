class Api::AdvertisementsController < Api::AdminApiController
  def index
    advertisements = Advertisement.all
    # advertisements_json = advertisements.as_json
    ad_json = []
    advertisements.each do |ad|
      adv = ad.as_json
      pic = Advertisement.find_by_id(ad['id']).picture.url
      if pic == 'picture/origin/missing.png'
        adv['image_url'] = ''
      else
        adv['image_url'] = 'https:' + pic
      end
      adv.delete 'picture_content_type'
      adv.delete 'picture_file_size'
      adv.delete 'picture_file_name'
      adv.delete 'picture_updated_at'
      ad_json << adv
    end
    render json: ad_json, status: 200
  end

  def show
    advertisement_id = params[:id]
    advertisement = Advertisement.find_by_id advertisement_id
    render json: advertisement, status: 200
  end
end
