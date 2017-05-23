import bottle

from config import APP_PORT


app = application = bottle.Bottle()


class StripPathMiddleware(object):
    """
    Get that slash out of the request
    """
    def __init__(self, a):
        self.a = a

    def __call__(self, e, h):
        e["PATH_INFO"] = e["PATH_INFO"].rstrip("/")
        return self.a(e, h)


from pages.beacon import *  # noqa





def stand_alone():
    bottle.run(app=StripPathMiddleware(app), host="", port=APP_PORT)




if __name__ == "__main__":
    stand_alone()
    print("Done")
