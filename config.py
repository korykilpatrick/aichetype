import os

class Config(object):
    DEBUG = False
    TESTING = False
    SECRET_KEY = os.urandom(24)

class DevelopmentConfig(Config):
    DEBUG = True

class ProductionConfig(Config):
    pass

class TestingConfig(Config):
    TESTING = True

DB_NAME = "aichetype"
DB_USER = "korykilpatrick"
DB_PASSWORD = "plumbus"
DB_HOST = "localhost"
DB_PORT = "5432"
