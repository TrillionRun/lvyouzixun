module Taobao
  def send_code(phone, code)
    bigfish = Alibaba::Bigfish.new('23534818','0f2165ab11c3457f05275794358d0ac2')
    ps = {
      rec_num: phone,
      sms_free_sign_name:'旅游咨询',
      sms_template_code: 'SMS_26075368',
      sms_param: {
        code: code
        }
      }
    puts ps
    bigfish.send_sms ps
  end
end
