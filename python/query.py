#!C:\Program Files (x86)\Python27\python.exe -u
#!/usr/bin/python

print
print

print '<HTML>'
print '<HEAD>'
print '<TITLE>Index</TITLE>'

# Bootstrap Scripts
print '<!-- Latest compiled and minified CSS -->'
print '<link rel="stylesheet" href="/../bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">'

print '<!-- Optional theme -->'
print '<link rel="stylesheet" href="/../bootstrap/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">'

print '<!-- Latest compiled and minified JavaScript -->'
print '<script src="/../bootstrap/js/jquery.min.js"></script>'
print '<script src="/../bootstrap/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>'
    
print '</HEAD>'
print '<BODY>'

print '<nav class="navbar navbar-default">'
print  '  <div class="navbar-header"> '
print      '<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">'
print      '</button>'
print      '<a class="navbar-brand" href="/">Business Data Management</a>'
print    '</div>'
print    '<ul class="nav navbar-nav">'
print      '<li class="dropdown">'
print        '<a class="dropdown-toggle" data-toggle="dropdown" href="#">Queries'
print        '<span class="caret"></span></a>'
print        '<ul class="dropdown-menu">'
print          '<li><a href="q1-query.py">Question 1</a></li>'
print          '<li><a href="q2-query.py">Question 2</a></li>'
print          '<li><a href="q3-query.py">Question 3</a></li>'
print          '<li><a href="q4-query.py">Question 4</a></li>'
print          '<li><a href="q5-query.py">Question 5</a></li>'
print          '<li><a href="q6-query.py">Question 6</a></li> '         
print        '</ul>'
print      '</li>'
print       '<li><a href="/../database.html">Database</a></li>'
print    '</ul>'
print '</nav>'


import mysql.connector, cgi, cgitb

# Create instance of FieldStorage 
form = cgi.FieldStorage() 

# Get data from fields
query = form.getvalue('query')
query = query.replace("\n", "") #remove the new lines that somehow gets included in the query

print """
<!-- An input form for a SQL Query -->
  <div class="col-lg-12">
    <form action="query.py" method="POST">
        <div class="form-group">
            <label for="query-text-area">Enter some SQL</label>
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
db = mysql.connector.connect(host="localhost",user="user",password="user-123",database="dbms_p" )

# prepare a cursor object using cursor() method
cursor = db.cursor()


# print the rows and colums
try:
    # execute SQL query using execute() method.
    cursor.execute(query)

    # fetch all of the rows from the query
    data = cursor.fetchall ()

    # fetch the column names
    headers = [header[0] for header in cursor.description]    
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

except mysql.connector.Error as err:
    print """
        <div class="col-lg-12">
        <div class="alert alert-danger" role="alert">
        """
    print "<strong>Something went wrong:</strong> {}".format(err)
    print """
        </div>
        </div>
        """

# disconnect from server
db.close()

print "</BODY>"
print "</HTML>"