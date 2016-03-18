# ZeroMQ demo client

import zmq

context = zmq.Context()

print("Connecting to hello world server...")
sock = context.socket(zmq.REQ)
sock.connect("tcp://*:5555")

for request in range(10):
    print("Sending request %s" % request)
    sock.send(b"Hello")

    message = sock.recv()
    print("Receieved reply %s [%s]" % (request, message))
