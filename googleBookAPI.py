# https://developers.google.com/books/docs/v1/using

# Getting API Key:
#   Go to the Google Cloud Console.
#   Create a new project or select an existing one.
#   Enable the Google Books API for your project.
#   After enabling the API, go to the "Credentials" section in the Cloud Console.
#   Create credentials for your project. You'll typically choose "API key" for client-side applications or "Service account key" for server-side applications.

# Getting Volume ID of a book
#   Go to Google Books site and search for the book
#   The volume id can be found the url
#   ex: https://www.google.ca/books/edition/Thinking_Fast_and_Slow/TA7Q27RWlj0C?hl=en&gbpv=1&dq=thinking+fast+and+slow&printsec=frontcover
#   volume id = TA7Q27RWlj0C

import requests

def get_book_details(volume_id, api_key):
    url = f"https://www.googleapis.com/books/v1/volumes/{volume_id}?key={api_key}"
    response = requests.get(url)
    data = response.json()
    return data

def print_book_details(book_details):
    if 'error' in book_details:
        print("Error:", book_details['error']['message'])
    else:
        print("Title:", book_details['volumeInfo']['title'])
        print("Authors:", ", ".join(book_details['volumeInfo'].get('authors', ['N/A'])))
        print("Publisher:", book_details['volumeInfo'].get('publisher', 'N/A'))
        print("Published Date:", book_details['volumeInfo'].get('publishedDate', 'N/A'))
        print("Description:", book_details['volumeInfo'].get('description', 'N/A'))
        print("ISBN-10:", book_details['volumeInfo'].get('industryIdentifiers', [{'type': 'ISBN_10', 'identifier': 'N/A'}])[0]['identifier'])
        print("ISBN-13:", book_details['volumeInfo'].get('industryIdentifiers', [{'type': 'ISBN_13', 'identifier': 'N/A'}])[1]['identifier'])
        print("Page Count:", book_details['volumeInfo'].get('pageCount', 'N/A'))
        print("Categories/Genres:", ", ".join(book_details['volumeInfo'].get('categories', ['N/A'])))
        print("Language:", book_details['volumeInfo'].get('language', 'N/A'))
        print("Preview Link:", book_details['volumeInfo'].get('previewLink', 'N/A'))
        print("Thumbnail Link:", book_details['volumeInfo'].get('imageLinks', {}).get('thumbnail', 'N/A'))
        print("Average Rating:", book_details['volumeInfo'].get('averageRating', 'N/A'))
        print("Ratings Count:", book_details['volumeInfo'].get('ratingsCount', 'N/A'))
        print("Dimensions:", book_details['volumeInfo'].get('dimensions', 'N/A'))
        print("Subjects/Topics:", ", ".join(book_details['volumeInfo'].get('categories', ['N/A'])))
        print("Edition:", book_details['volumeInfo'].get('edition', 'N/A'))
        print("Format:", book_details['volumeInfo'].get('printType', 'N/A'))
        print("Links:", book_details['volumeInfo'].get('infoLink', 'N/A'))
        print("Authors (Additional):", ", ".join(book_details['volumeInfo'].get('authors', ['N/A'])[1:]))
        print("Industry Identifiers:", ", ".join([f"{identifier['type']}: {identifier['identifier']}" for identifier in book_details['volumeInfo'].get('industryIdentifiers', [{'type': 'N/A', 'identifier': 'N/A'}])]))
        print("Reading Modes:", ", ".join(book_details['accessInfo'].get('accessViewStatus', 'N/A')))
        print("Reviews:", book_details['volumeInfo'].get('reviews', 'N/A'))
        print("Series Information:", book_details['volumeInfo'].get('seriesInfo', 'N/A'))
        print("Sale Information:", book_details['saleInfo'].get('saleability', 'N/A'))
        print("Countries:", ", ".join(book_details['accessInfo'].get('country', 'N/A')))
        print("Public Domain:", book_details['accessInfo'].get('publicDomain', 'N/A'))
        print("Ebook Information:", book_details['saleInfo'].get('isEbook', 'N/A'))
        print("Access Information:", book_details['accessInfo'].get('webReaderLink', 'N/A'))
        print("Volume ID:", book_details['id'])

# Replace 'YOUR_API_KEY' with your actual API key
api_key = ''
volume_id = 'TA7Q27RWlj0C'  # Replace with the volume ID of the book you want to fetch
book_details = get_book_details(volume_id, api_key)
print_book_details(book_details)

