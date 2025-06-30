from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

@library
class AutoCompleteHelpers:

    def _get_driver(self):
        sel_lib = BuiltIn().get_library_instance("SeleniumLibrary")
        return sel_lib.driver

    @keyword
    def find_child_input(self, parent_locator, child_xpath):
        sel_lib = BuiltIn().get_library_instance("SeleniumLibrary")
        parent = sel_lib.get_webelement(parent_locator)
        return parent.find_element("xpath", child_xpath)


    @keyword
    def click_suggestion_with_text(self, expected_text, timeout=10):
        """Click a suggestion matching the given text."""
        driver = self._get_driver()
        wait = WebDriverWait(driver, timeout)
        suggestions = wait.until(EC.presence_of_all_elements_located(
            (By.CSS_SELECTOR, "div.auto-complete__menu div.auto-complete__option")
        ))
        for option in suggestions:
            text = option.text
            print(f"Suggestion found: {text}")
            if text == expected_text:
                option.click()
                return
        raise AssertionError(f"Option '{expected_text}' not found in suggestions")

    @keyword
    def click_all_matching_suggestions(self, input_locator, trigger_char="b", timeout=3):
        """Click all suggestions triggered by input character."""
        driver = self._get_driver()
        input_box = driver.find_element(By.CSS_SELECTOR, input_locator)
        input_box.click()
        input_box.send_keys(trigger_char)
        time.sleep(0.5)

        while True:
            try:
                wait = WebDriverWait(driver, timeout)
                suggestions = wait.until(EC.presence_of_all_elements_located(
                    (By.CSS_SELECTOR, "div.auto-complete__menu div.auto-complete__option")
                ))
                for option in suggestions:
                    text = option.text
                    print(f"Multi Suggestion found: {text}")
                    option.click()
                    time.sleep(0.5)
                    break
            except:
                print("No more suggestions found.")
                break
            finally:
                input_box.clear()
                input_box.click()
                input_box.send_keys(trigger_char)
