# -*- coding: utf-8 -*-
def index():
    return locals()

"""@auth.requires_login()"""
def newcourses():
	form = SQLFORM(db.new_courses).process()
	if form.accepted: redirect(URL('courses'))
	return locals()

def course():
    return locals()

"""@auth.requires_membership('managers')"""
def manage():
	grid = SQLFORM.grid(db.new_courses)
	return locals()

"""@auth.requires_login()"""
def courses():
	"""rows = db(db.new_courses).select()"""
	return locals()


def user():
	"""
		form = SQLFORM(db.auth_user).process()
		if form.accepted: redirect(URL('index'))

		Aquí quiero modificar el index.html para añadir el form que ya tiene web2py para facilitarnos el log in, log out, etc.
	"""
	return dict(auth=auth())


@cache.action()
def download():
    """
    allows downloading of uploaded files
    http://..../[app]/default/download/[filename]
    """
    return response.download(request, db)


def call():
    """
    exposes services. for example:
    http://..../[app]/default/call/jsonrpc
    decorate with @services.jsonrpc the functions to expose
    supports xml, json, xmlrpc, jsonrpc, amfrpc, rss, csv
    """
    return service()
