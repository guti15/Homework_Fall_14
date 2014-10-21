from twython import TwythonStreamer
from twython import Twython


APP_KEY = 'BD54TxjKmR5EoixxYVuUDAgRs'
APP_SECRET ='gggBr07qUAfggQ8XNIjtGawnwkOLKoAgH4tGA8zeHi3nscoDVL'

OAUTH_TOKEN = "69705916-go6EviDPW110yyzkUImmVJU1mitEO6DlIs7DLoOdT"
OAUTH_TOKEN_SECRET ="pl4NjQ3a50N9OHx9TZCvPEJYySRvNvwg1sjzj2wvg9D4f"



class MyStreamer(TwythonStreamer):
    def on_success(self, data):
        if 'text' in data:
            print data['text'].encode('utf-8')
        # Want to disconnect after the first result?
        # self.disconnect()

    def on_error(self, status_code, data):
        print status_code, data

# Requires Authentication as of Twitter API v1.1
stream = MyStreamer(APP_KEY, APP_SECRET,
                    OAUTH_TOKEN, OAUTH_TOKEN_SECRET)

stream.statuses.filter(track='tweet')


# twitter = Twython(APP_KEY,APP_SECRET, OAUTH_TOKEN, OAUTH_TOKEN_SECRET)
# avatar= open('sweet.jpg','rb')
# twitter.update_profile_image(image=avatar) 


#stream.user() # Read the authenticated users home timeline (what they see on Twitter) in real-time
#stream.site(follow='twitter')
