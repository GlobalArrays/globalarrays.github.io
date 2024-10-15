import os
import re

def replace_ssi_with_jekyll_includes(root_dir):
    # Regex pattern to match the SSI include statements
    ssi_pattern = re.compile(r'<!--#include virtual="([^"]+)"-->')

    # Walk through all the files in the root directory and sub-folders
    for subdir, _, files in os.walk(root_dir):
        for file in files:
            # Only process .shtml files
            if file.endswith('.shtml'):
                file_path = os.path.join(subdir, file)

                # Read the file content
                with open(file_path, 'r') as f:
                    content = f.read()

                # Replace all SSI includes with Jekyll's include syntax
                new_content = ssi_pattern.sub(r'{% include_relative \1 %}', content)

                # Write the changes back to the file if any replacements were made
                if content != new_content:
                    with open(file_path.replace('.shtml', '.html'), 'w') as f:
                        f.write(new_content)
                    print(f'Replaced SSI includes in: {file_path} and saved as .html')

if __name__ == "__main__":
    # Specify the root directory where your files are located
    root_directory = '/home/panyala/code/GA-WEB/armci/'
    replace_ssi_with_jekyll_includes(root_directory)
