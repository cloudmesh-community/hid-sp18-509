MONGO_HOST = 'localhost'

MONGO_PORT = 27017

MONGO_DBNAME = 'dog_db'

DOMAIN = {
    'dog': {
        'schema': {
            'breed': {'type': 'string'},
            'weight': {'type': 'string'},
            'height': {'type': 'string'},
            'color': {'type': 'string'},
            'sex': {'type': 'string'}
        }
    }
}

RESOURCE_METHODS = ['GET', 'POST', 'DELETE']
