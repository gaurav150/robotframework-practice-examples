import time
from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.common import NoAlertPresentException


@library
class Alert:
    def __init__(self):
        self.sel_lib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def wait_until_alert_is_visible(self,timeout=10,poll_frequency=0.5):
        """
                Waits until a browser alert is present.

                Arguments:
                    - timeout: Maximum time to wait in seconds (default is 10).
                    - poll_frequency: How often to check in seconds (default is 0.5).
                """
        driver = self.sel_lib.driver
        end_time = time.time() + timeout

        while time.time() < end_time:
            try:
                alert = driver.switch_to.alert
                _ = alert.text  # Accessing alert.text will raise if not present
                return  # Alert is present
            except NoAlertPresentException:
                time.sleep(poll_frequency)

        raise AssertionError(f"Alert was not present after {timeout} seconds.")
