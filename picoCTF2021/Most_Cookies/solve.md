1. Identify the SecretKey that encrypts the Session cookie with "flask Session Cookie Decoder/Encoder".
	https://noraj.github.io/flask-session-cookie-manager/

	SecretKey: fortune

2. Rewrite very_auth in the session information to admin and encrypt it with the secret key.
	Rewrited session cookie: eyJ2ZXJ5X2F1dGgiOiJhZG1pbiJ9.YJp73Q.5eymnsdruqOXtbeWw7-V-sAA9GE

3. access /display with rewrited session cookie
