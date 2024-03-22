def extract_urls(text)
  pattern = %r{
    (?i) (?:https?://|ftp://) # Case insensitive, captures urls starting with http, https, or ftp
    (?:(?:www\.|\w+\\.)?[\w-]+\.[\w.-]{2,}) # Captures links beginning with or without www., then the domain name and top level domain separated by a .
    (?:/[\w/.?=&+]+)? # Captures paths and queries starting with a backslash after the top level domain to the end of the url
    }x

  text.scan(pattern) do |url|
    puts url
  end
end

sample_text = "Visit our site at http://www.example.org for more information.
Check out our search page at https://example.com/search?q=ruby+regex.
Don't forget to ftp our resources at ftp://example.com/resources."

extract_urls(sample_text)

'''
Objective: Develop a Ruby program to extract all URLs from a block of text. Your program should be able to
recognize URLs that start with http, https, or ftp, and could contain various domain names and paths.

Task:
Write a Ruby script that takes a string as input and outputs each URL found within the string on a new line.
Your script should correctly identify URLs within the text, including those that have paths, query parameters,
or fragments.

Guidelines:
Use regular expressions to identify the URLs within the text.
Ensure that your regex pattern comprehensively matches different types of URLs, including those with and
without www, and with any top-level domain (e.g., .com, .org, .net).
Test your script with a sample text containing multiple URLs to verify its accuracy.

Output:
http://www.example.org
https://example.com/search?q=ruby+regex
ftp://example.com/resources
'''
