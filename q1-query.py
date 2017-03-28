#!/usr/bin/python

print
print

print '<HTML>'
print '<HEAD>'
print '<TITLE>Index</TITLE>'

# Bootstrap Scripts
print '<!-- Latest compiled and minified CSS -->'
print '<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">'

print '<!-- Optional theme -->'
print '<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">'

print '<!-- Latest compiled and minified JavaScript -->'
print '<script src="bootstrap/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>'
    
print '</HEAD>'
print '<BODY>'

print '<nav class="navbar navbar-default">'
print  '  <div class="navbar-header"> '
print      '<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">'
print      '</button>'
print      '<a class="navbar-brand" href="/">Business Data Management</a>'
print    '</div>'
print '</nav>'


import MySQLdb, cgi, cgitb

# Create instance of FieldStorage 
form = cgi.FieldStorage() 

# Get data from SQL file
with open('q1.sql', 'r') as myfile:
    query=myfile.read()



print """
<!-- An input form for a SQL Query -->
  <div class="col-lg-12">
    <form action="query.py" method="POST">
        <div class="form-group">
            <label for="query-text-area">Find the tickers and closing prices of all stocks exchanged in 2017</label>
"""

print """<textarea required="true" id="query-text-area" name="query" type="text" class="form-control" rows="5" placeholder="">""" + query +"""</textarea>"""
print """
             <button type="submit" class="btn btn-primary" type="button">Execute</button>
             <a href="/" class="btn btn-default" type="button">Reset</a>

        </div>
    </form>
  </div> 
"""


# Open database connection
db = MySQLdb.connect("localhost","user","user-123","dbms_p" )

# prepare a cursor object using cursor() method
cursor = db.cursor()

# execute SQL query using execute() method.
cursor.execute(query)

# fetch all of the rows from the query
data = cursor.fetchall ()

# fetch the column names
headers = [header[0] for header in cursor.description]


# print the rows and colums
print """<div class="col-lg-12">"""
print """<table class="table table-hover">"""
print "<thead>"
for w in range(len(headers)):
    print "<th>"
    print headers[w]
    print "</th>"
print "</thead>"

print "<tbody>"
for x in range(len(data)):
    print "<tr>"    
    for y in range(len(data[x])):
        
        print "<td>"
        print data[x][y]
        print "</td>"
    print "</tr>"

print """</tbody></table>"""
print "</div>"





# disconnect from server
db.close()

print "</BODY>"
print "</HTML>"