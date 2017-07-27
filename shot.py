# coding: utf-8
from marionette_driver.marionette import Marionette
from PIL import Image
from PIL import ImageChops
import sys
import StringIO

url = 'https://mozilla.com/'
if len(sys.argv) > 1:
  url = sys.argv[1]

client = Marionette('localhost', port=2828)
client.start_session()

def shot(fn):
  client.navigate(url)
  shot = client.screenshot(format='binary')
  img = Image.open(StringIO.StringIO(shot))
  img.save(fn)
  #img.convert('RGB')
  return img

client.set_pref('layout.css.servo.enabled', False)
old = shot('/tmp/shot_old.png')
client.set_pref('layout.css.servo.enabled', True)
stylo = shot('/tmp/shot_stylo.png')

diff = ImageChops.difference(old, stylo).convert('RGB')
diff.save('/tmp/diff.png')

sub = ImageChops.subtract(old, stylo).convert('RGB')
diff.save('/tmp/subtract.png')