# DOCS

## INITIALIZATION
-   Clone Repo
-   Inside the project on the command line type  `bundle`
-   Once bundle is done type  `rails db:create db:migrate db:seed`
-   To start the server type  `rails s`  or  `rails server`

## ENDPOINTS

* [Users](#users)
* [Sessions](#sessions)
* [Raffles](#raffles)

## Users

### Create user
URL:
`POST /api/users`

SEND AS BODY:
```
{
	"user": {
		"email": USER EMAIL,
		"password": USER PASSWORD
		"password_confirmation": SAME AS USER PASSWORD,
		"is_admin": BOOLEAN
	}
}
```
RESPONSE:
```
{
    "user": {
        "id": UNIQUE ID,
        "email": USER EMAIL,
        "is_admin": BOOLEAN,
        "authentication_token": ACCESS TOKEN
    }
}
```
**NOTE**: From now on we need to send the `authentication_token` as `Authorization` in the header following this format: `Authorization: Token token="authentication_token"` unless specified.

### Get a specific user:
URL:
`GET api/users/{:id}`

RESPONSE:

```
{
    "user": {
        "id": UNIQUE ID,
        "email": "USER EMAIL",
        "is_admin": BOOLEAN
    }
}
```
to get a **specific user's subscribed to raffles** add raffles as a param. i.e `api/users/{:id}?raffles=true`
RESPONSE: 

```
{
    "user": {
        "id": UNIQUE ID,
        "email": "USER EMAIL",
        "is_admin": BOOLEAN,
        "raffles": [{..}]
    }
}
```

## Sessions

### Create a Session:
To create a session or login you need the email and the password as the body of the request

URL:
`POST /api/sessions`

BODY: 
```
{
	"email": USER EMAIL,
	"password": USER PASSWORD
}
```

RESPONSE: 
```
{
    "user": {
        "email": USER EMAIL,
        "is_admin": BOOLEAN,
        "authentication_token": AUTHENTICATION TOKEN
    }
}
```
 We need this token to initiate the session on the FE (as a cookie).

### Destroy a session:

This updates the user and creates a new authentication token (If the cookie and the authentication token are different we will not be able to access other endpoints until the user starts another session).

URL:
`DELETE /api/sessions`

RESPONSE:
`200 OK`

Needs the Authorization token in the header. 

## Raffles

### Get All Raffles:

URL:
`GET /api/raffles`

RESPONSE:
```
"raffle": [
    {
        "id": UNIQUE ID,
        "name": NAME OF RAFFLE,
        "description": DESCRIPTION OF RAFFLE,
        "created_by": ID OF THE USER,
        "created_at": DATE TIME,
        "winner": WINNER OF RAFFLE (IF IS NOT SET null),
        "contestants": NUMBER OF CONTESTANTS INSIDE RAFFLE
    },
    {...},
    {...}
]		
```

### Get a specific Raffle

URL:
`GET /api/raffles/{:id}`

RESONSE:
```
{
    "raffle": {
		"id": UNIQUE ID,
        "name": NAME OF RAFFLE,
        "description": DESCRIPTION OF RAFFLE,
        "created_by": ID OF THE USER,
        "created_at": DATE TIME,
        "winner": WINNER OF RAFFLE (IF IS NOT SET null),
        "contestants": NUMBER OF CONTESTANTS INSIDE RAFFLE
    }
}
```

If we want to **get the contestants inside the Raffle** we need to **add users param in the url** ie. `/api/raffles/{:id}?users=true`

RESPONSE:

```
{
    "raffle": {
		"id": UNIQUE ID,
        "name": NAME OF RAFFLE,
        "description": DESCRIPTION OF RAFFLE,
        "created_by": ID OF THE USER,
        "created_at": DATE TIME,
        "winner": WINNER OF RAFFLE (IF IS NOT SET null),
        "contestants": NUMBER OF CONTESTANTS INSIDE RAFFLE,
        "users": [{
			"id": ID OF USER,
			"email": EMAIL OF USER
		}]
    }
}
```

### Add a contestant to raffle
To add a contestant to raffle we need to **add the user_email param to the raffle as a PATCH request** ie.
`/api/raffles/{:id}?user_email=EMAIL OF USER TO ADD`

### Add a winner to raffle
To add a winner to the raffle we need to **add the winner param to the raffle as a PATCH request** ie.
`/api/raffles/{:id}?winner=true`

RESPONSE:

```
{
    "raffle": {
		"id": UNIQUE ID,
        "name": NAME OF RAFFLE,
        "description": DESCRIPTION OF RAFFLE,
        "created_by": ID OF THE USER,
        "created_at": DATE TIME,
        "winner": WINNER OF RAFFLE,
        "contestants": NUMBER OF CONTESTANTS INSIDE RAFFLE
    }
}
```
