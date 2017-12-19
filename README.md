# Create-a-RESTful-API-using-PHP

Implement a simple RESTful web service using PHP.

Your web service will provide information about books.

http://localhost/bookswill give list of books (title, price, category) that are stored in your database.

http://localhost/books/idwill give all book details (title, year, price, category, authors) for given book id.

Results will be in JSON or XML format.

Database schema is as follows:

Book (Book-id, Title, Year, Price, Category)
Book_Authors (Book-id, Author-id)
Authors (Author-id, Author_Name)

You can use books.xml file to populate your database.

