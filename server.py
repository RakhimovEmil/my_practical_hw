from flask import Flask, request
from pprint import pformat

app = Flask(__name__)

d = {}


@app.before_request
def write_log():
    f = open('/var/log/server.log', 'a')
    f.write(pformat(request.headers))
    f.write('\r\n')
    f.close()
    return None


@app.route("/storage/<filename>", methods=['GET'])
def get(filename):
    if filename in d:
        return d[filename], 200
    return " ", 404


@app.route("/storage/<filename>", methods=['PUT'])
def put(filename):
    if request.method == 'PUT':
        req = request.get_json()
        if req == None:
            return " ", 400
        d[filename] = req
        return " ", 201


@app.route("/storage/<filename>", methods=['DELETE'])
def delete(filename):
    if filename in d:
        del d[filename]
    return 204


if __name__ == "__main__":
    app.run(port=8080)
