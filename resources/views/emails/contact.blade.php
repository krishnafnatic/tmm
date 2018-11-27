<!DOCTYPE html>
<html>
    <head>
        <title>Contac us Email</title>
    </head>
    
    <body>
        <h2>$contact['name'] has contacted from contact us form. Below are the details</h2>
        Name: $contact['name']
        <br/>
		E-mail: {{ $contact['email'] }}
		<br/>
		Message: {{ $contact['message'] }}
    </body>

</html>