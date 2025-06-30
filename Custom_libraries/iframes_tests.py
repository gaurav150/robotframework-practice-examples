from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Iframes:
    def __init__(self):
        self.sel_lib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def write_text_to_file(self,file_name,data):
        try:
            with open(file_name,"w") as f:
                for ele in data:
                    f.write(ele)
            print(f"✅ Successfully wrote data to {file_name}")
        except Exception as e:
            print(f"❌ Failed to write to file: {file_name} due to {e}")
            raise