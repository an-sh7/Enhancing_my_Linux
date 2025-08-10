import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

visited = set()
all_links = []

START_URL = input("Enter the start URL (must end with /): ").strip()

def scrape_dir(url):
    if url in visited:
        return
    visited.add(url)

    print(f"[+] Scanning: {url}")
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
    except Exception as e:
        print(f"[-] Failed to access {url}: {e}")
        return

    soup = BeautifulSoup(response.text, 'html.parser')
    for link in soup.find_all('a'):
        href = link.get('href')
        if not href or href in ['../', '/'] or href.startswith('/'):
            continue

        full_url = urljoin(url, href)

        # Stay inside the base folder
        if not full_url.startswith(START_URL):
            continue

        # Skip index.html and query parameter links (?something)
        if "index.html" in full_url.lower() or "?" in full_url:
            continue

        if full_url.endswith('/'):
            scrape_dir(full_url)
        else:
            all_links.append(full_url)

scrape_dir(START_URL)

with open("download_list.txt", "w") as f:
    for link in all_links:
        f.write(link + "\n")

print(f"[✔] Total files found (cleaned): {len(all_links)}")
print("[✔] Saved to download_list.txt")
