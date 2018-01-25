from flask import Flask, request
import threading
import time
import random
app = Flask(__name__)

speed = 0
padel = 0
padel_cofficient = random.randint(5,11)
drag_coefficient = random.randint(1,11) * 1.0 / 1000
mass = 5
velocity = 0
ts = 0.2

def run_car():
  global velocity
  while True:
    print("padel {} velocity {}".format(padel, velocity))
    f = padel * padel_cofficient - mass * velocity * velocity * drag_coefficient
    velocity += f * 1.0 / mass 
    if velocity < 0:
      velocity = 0
    time.sleep(ts)

@app.before_first_request
def activate_job():
  thread = threading.Thread(target=run_car)
  thread.start()

@app.route("/set")
def set():
  padel_set = request.args.get("padel", default=None, type=int)
  if padel_set < 0 or padel_set >= 50:
    return "padel needs to be between 0 and 50"
  global padel
  padel = padel_set
  return "Set padel to {}".format(padel)

@app.route("/get")
def get():
  return "padel {} velocity {}".format(padel, velocity)
