# Web Directory Scraper

This script recursively scans a web directory (with open listing) and collects all file links, saving them to a text file for easy downloading or further processing.

---

## Features

- **Recursive Scanning:** Crawls through all subdirectories starting from a given URL.
- **Link Filtering:** Ignores parent directory links, index files, and external links.
- **Output:** Saves all discovered file URLs to `download_list.txt`.
- **Progress Reporting:** Prints progress and summary to the console.

---

## Requirements

- Python 3.x
- [requests](https://pypi.org/project/requests/)
- [beautifulsoup4](https://pypi.org/project/beautifulsoup4/)

### Install dependencies

```bash
python3 -m venv venv
source venv/bin/activate
pip install requests beautifulsoup4
```

---

## Usage

1. Run the script:

   ```bash
   python scrape.py
   ```

2. Enter the starting URL when prompted (must end with `/`), for example:

   ```
   Enter the start URL (must end with /): https://example.com/files/
   ```

3. The script will scan the directory and save all file links to `download_list.txt` in the current directory.

---

## How it works

- The script starts at the provided URL and parses the HTML for `<a>` tags.
- It follows subdirectory links recursively, staying within the base URL.
- It skips links to parent directories (`../`), root (`/`), index files, and links with query parameters.
- All discovered file links are written to `download_list.txt`.

---

## Customization

- You can modify the filtering logic in [`scrape.py`](scrape.py) to include or exclude different types of files or links.
- Adjust the output filename as needed.

---

## Example Output

After running the script, `download_list.txt` will contain:

```md
https://example.com/files/file1.pdf
https://example.com/files/subdir/file2.zip
```

---

## Notes

- This script is intended for open directory listings and may not work on sites with JavaScript navigation or authentication.

---
