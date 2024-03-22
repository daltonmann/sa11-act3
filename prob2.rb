def parse_invoices(invoice_data)
  invoice_data.each_line do |line|
    match_data = line.match(/(\d{4}-\d{2}-\d{2}) - (INV[\d]+) - ([^-]+) - \$([0-9,]+)/)
    if match_data
      date = match_data[1] # Captures the date in YYYY-MM-DD format
      invoice_number = match_data[2] # Captures the string beginning with INV and all numbers after it
      client_name = match_data[3] # Captures a string that is not a hyphen for the name
      amount = match_data[4] # Captures the string beginning with $ for the dollar amount
      puts "Date: #{date}, Invoice Number: #{invoice_number}, Client: #{client_name}, Amount: $#{amount}"
    end
  end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)

'''
Objective: Create a Ruby program that parses a structured text containing multiple invoice entries and extracts
key details from each entry.

Task:
Construct a Ruby script that processes a string with multiple lines, where each line represents an invoice
entry formatted as [Date] - [Invoice Number] - [Client Name] - [Amount].
Extract the date, invoice number, client name, and amount from each line and display them in a structured format.

Guidelines:
Utilize regular expressions to dissect each line of the invoice entries and capture the necessary components.
The date format is YYYY-MM-DD, invoice numbers are alphanumeric, client names may contain spaces and letters,
and amounts are prefixed with a dollar sign.

Output:
Date: 2023-03-01, Invoice Number: INV001, Client: Acme Corp, Amount: $1000
Date: 2023-03-02, Invoice Number: INV002, Client: Beta LLC, Amount: $2050
Date: 2023-03-03, Invoice Number: INV003, Client: Gamma Inc, Amount: $3500
'''
