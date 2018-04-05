import time

import gi
from gi.repository import Notify

gi.require_version('Notify', '0.7')

Notify.init(app_name = 'notification-update-example')
notification = Notify.Notification.new("Notification", "Original message", None)
notification.show()
# time.sleep(3)
notification.update("More notification", "Updated message", None)
notification.show()
