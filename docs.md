# DOC

## INITIALIZATION

## ENDPOINTS

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
 
