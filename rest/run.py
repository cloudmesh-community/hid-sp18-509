# REST Demo
from eve import Eve
import platform

settings = {
    'MONGO_HOST':'localhost',
    'MONGO_PORT':27017,
    'MONGO_DBNAME':'testDB',
    'DOMAIN':{'contacts':{}}
}

app = Eve(settings = settings)

@app.route('/processor')
def processor():
    name = platform.processor()
    return name

@app.route('/ram')
def processor():
    ram = platform.ram()
    return ram

@app.route('/files')
def processor():
    files = platform.files()
    return files

@app.route('/diskspace')
def processor():
    diskspace = platform.diskspace()
    return diskspace

@app.route('/who')
def processor():
    who = platform.who()
    return who

@app.route('/uname')
def processor():
    uname = platform.uname()
    return uname


if __name__ == "__main__":
    app.run(debug = True)









