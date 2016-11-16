module Taobao
  def send_code(phone, code)
    url = 'http://gw.api.taobao.com/router/rest'
    # sandbox
    # url = 'https://gw.api.tbsandbox.com/router/rest'
    data = {
      app_key: '23534818',
      format: 'json',
      method: 'alibaba.aliqin.fc.sms.num.send',
      partner_id: 'apidoc',
      rec_num: phone,
      sign_method: 'md5',
      sms_free_sign_name: '旅游咨询',
      sms_param: {code: code},
      sms_template_code: 'SMS_26075368',
      sms_type: 'normal',
      timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
      v: '2.0'
    }
    sign_str = ''
    data.each do |key, value|
      sign_str += key.to_s
      if key == :sms_param
        sign_str += "{\"code\":\"#{code}\"}"
      else
        sign_str += value.to_s
      end
    end

    digest = OpenSSL::Digest.new 'sha1'
    key = '0f2165ab11c3457f05275794358d0ac2'

    sign_str = key+sign_str+key
    #sign = OpenSSL::HMAC.hexdigest( digest, key, sign_str)
    md5 = Digest::MD5.new
    md5 << sign_str.force_encoding(Encoding::UTF_8)
    sign = md5.hexdigest
    data.merge! sign: sign
    header = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'charset': 'utf-8'
    }
    response = RestClient.post url, data, header
    render plain: (sign_str.force_encoding(Encoding::UTF_8)+"*"+response.to_s)
  end
end
