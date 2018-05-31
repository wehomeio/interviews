import requests


def getHTMLText(url):
    try:
        data = requests.get(url, timeout = 30)
        data.raise_for_status()
        data.encoding = data.apparent_encoding
        return data.text
    except:
        return ""


def set(padel):
    url = "http://127.0.0.1:5000/set?padel={}".format(int(padel))
    data = getHTMLText(url)
    print(data)


def get():
    url = "http://127.0.0.1:5000/get"
    data = getHTMLText(url)
    print(data)
	
	
if __name__ == '__main__':
	# set(3)
	get()