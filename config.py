import os
import env

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

DB_NAME = env.DB_NAME
DB_USER = env.DB_USER
DB_PASSWORD = env.DB_PASSWORD
DB_HOST = env.DB_HOST
DB_PORT = env.DB_PORT
